;; This file is part of SHOOT TO MOVE
;;  Copyright (C) 2020 Marc Landes Molla
;;
;;     SHOOT TO MOVE is free software: you can redistribute it and/or modify
;;     it under the terms of the GNU General Public License as published by
;;     the Free Software Foundation, either version 3 of the License, or
;;     (at your option) any later version.
;; 
;;     SHOOT TO MOVE is distributed in the hope that it will be useful,
;;     but WITHOUT ANY WARRANTY; without even the implied warranty of
;;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;     GNU General Public License for more details.
;; 
;;     You should have received a copy of the GNU General Public License
;;     along with SHOOT TO MOVE  If not, see <https://www.gnu.org/licenses/>.

.include "cpctelera.h.s"
.include "main.h.s"
.include "man/man_entity.h.s"
.include "man/man_patrol.h.s"
.include "cmp/entity.h.s"

.module sys_ai_control

contador_tiempo = 50


;;INITS AI CONTROL
;; INPUT:
;; hl->puntero al array de entidades
sys_ai_control_init::

	ld (_ent_array_ptr), hl ;[6] modificac el array de entidades

	ld (_ent_array_ptr_temp_standby), hl

	ret

sys_ai_nothing::
	ret

sys_ai_stand_by::
_ent_array_ptr_temp_standby = .+2
	ld iy, #0x0000

	ld a, e_ai_aim_x(iy)
	or a
	ret z	;;si e_ai_aim_x no es cero entonces seguimos

	;;PRESSED KEY -> move to player

	;ld a, e_x(iy)
	;ld e_ai_aim_x(ix), a ;;guardamos la posicion del personaje como objetivo de la ia
	;ld a, e_y(iy)
	;ld e_ai_aim_y(ix), a
	;ld e_ai_st(ix), #e_ai_st_move_to
	;;ANTES DE LLAMAR A PATROL Pone el contador a cero
	ld a, #00
	call man_patrol_get ;;devuelve en hl el step de la patrulla
	ld e_ai_patrol_step_l(ix), l
	ld e_ai_patrol_step_h(ix), h
	ld e_ai_pre_st(ix), #e_ai_st_stand_by
	ld e_ai_st(ix), #e_ai_st_patrol

	ret

sys_ai_move_to::

	;; Comprobamos si tiene que disparar o no
	ld a, e_ai_contador(ix)
	sub #contador_tiempo
	jr nz, _no_disparar ;;si es cero (=contadortiempo) disparamos
_disparar:
	ld e_ai_contador(ix), #00
	;;calculamos hacia donde se debe mover la bala
	;; b> 0: y arriba
	;;  	1: x derecha
	;; 	2: x izquierda
	;;	3: y abajo 
	ld a, e_vx(ix)
	cp #0 ;;Si vx  es cero, comprobamos vy
	jr z, _comprobarY
_comprobarVx:
	ld a, e_vx(ix)
	sub #0	;;si a menor que cero el carry se activa
	jr c, _disparar_izquierda
_disparar_derecha:
	ld b, #1
	jr _nada
_disparar_izquierda:
	ld b, #0
	jr _nada

_comprobarY:
	;;comprobamos si vy es positivo
	ld a, e_vy(ix)
	sub #1	;;si a menor que cero el carry se activa
	jr c, _disparar_arriba
_disparar_abajo:
	ld b, #3
	jr _nada
_disparar_arriba:
	ld b, #0
_nada:
	;;4341
	;;DE AL LLEGAR 00
	;;IX INICIAL 4A37
	;;4c4e

	push de
	ld d, e_x(ix)
	ld e, e_y(ix)
	push ix
	ld c, #0
	call man_entity_crearBala
	pop ix
	pop de

_no_disparar:
	ld a, e_ai_contador(ix)
	inc a
	ld e_ai_contador(ix), a

	ld e_vy(ix), #0

	;; if (obj_x > x) .....
	;; if (obj_x - x > 0)
	;; al restar si sale menor de 0 se activaria el carry
	;; si es mayor que 0 -> nc es cierto
	
	ld a, e_ai_aim_x(ix)  	;;A = x_objetivo
	sub e_x(ix) 			;;A = obj_x - x
	jr nc, _objx_greater_or_equal		;; if(obj_x - x > 0) -> objx_greater

_objx_lesser:
	ld e_vx(ix), #-1
	jr _endif_x

_objx_greater_or_equal:
	jr z, _arrived_x
	ld e_vx(ix), #1
	jr _endif_x

_arrived_x:
	ld e_vx(ix), #0
	;ld e_ai_st(ix), #e_ai_st_stand_by

_endif_x: 

;;UPDATE Y
	ld a, e_ai_aim_y(ix)  	;;A = x_objetivo
	sub e_y(ix) 			;;A = obj_x - x
	jr nc, _objy_greater_or_equal		;; if(obj_x - x > 0) -> objx_greater

_objy_lesser:
	ld e_vy(ix), #-2
	jr _endif_y

_objy_greater_or_equal:
	jr z, _arrived_y
	ld e_vy(ix), #2
	jr _endif_y

_arrived_y:
	ld e_vy(ix), #0
	ld a, e_vx(ix)
	or a
	jr nz, _endif_y ;;si a es 0 entonces hacemos stand by

	ld a, e_ai_pre_st(ix)
	ld e_ai_st(ix), a
	ld e_ai_pre_st(ix), #e_ai_st_move_to 

_endif_y: 

	ret

;;UPDATES AI CONTROL
;; INPUT:
;; A -> Numero de elementos del array
sys_ai_control_update::

	ld (_ent_counter), a
;; Codigo automodificable
_ent_array_ptr = . + 2
	ld ix, #0x0000	;;[4] cargamos el array de entidades en ix

_loop:

	ld a, e_ai_st(ix)
	cp #e_ai_st_noAI ;;comparo la ia de la entidad con la de no AI
	jr z, _no_AI_ent;;si ai es 0 no es AI, salto

_AI_ent:

	cp #e_ai_st_stand_by
	call z, sys_ai_stand_by
	cp #e_ai_st_move_to
	call  z, sys_ai_move_to
	cp #e_ai_st_patrol
	call  z, sys_ai_patrol

_no_AI_ent:



_ent_counter = . + 1 ;;todo esto controla que recorra todas las entidades
	ld a,#0
	dec a
	ret z

	ld (_ent_counter),a


	ld de, #sizeof_e
	add ix, de

	jr _loop


;;CONTROLA LA PATRULLA
;;INPUT IX= Puntero a la entidad
;; DESTRUYE : AF, IY
sys_ai_patrol::
	;;HL apunta al siguiente (x,y) ai patrol step
	ld l, e_ai_patrol_step_l(ix)
	ld h, e_ai_patrol_step_h(ix)

	;;COMPROBAR X!=-1
	ld a, (hl)
	cp #patrol_invalid_move_x
	jr z, _reset_patrol

	
	ld e_ai_aim_x(ix), a
	inc hl
	ld a, (hl)
	ld e_ai_aim_y(ix), a

	;; INCREMENTAMOS HL PARA PASAR A LA SIGUIENTE X
	inc hl
	ld e_ai_patrol_step_l(ix), l
	ld e_ai_patrol_step_h(ix), h

	;;CAMBIAMOS EL ESTADO
	ld e_ai_pre_st(ix), #e_ai_st_patrol
	ld e_ai_st(ix), #e_ai_st_move_to

	;ld a, e_ai_patrol_step(ix) ;;cargo el paso de la patrulla
	;cp #0
	;jr z, _step0
	;cp #1
	;jr z, _step1

	ret


_reset_patrol:
	;;GET NEXT 2 Bytes pointed by hl, que son el puntero al punto inicial
	;;de la patrulla

	inc hl
	ld a, (hl)
	inc hl
	ld h, (hl)

	;;RESETEAMOS LA PATRULLA AL PRINCIPIO
	ld e_ai_patrol_step_l(ix), a
	ld e_ai_patrol_step_h(ix), h

	ret