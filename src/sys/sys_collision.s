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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SYSTEM THAT CHECKS COLLISIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.include "cpctelera.h.s"
.include "main.h.s"
.include "cmp/entity.h.s"
.include "man/man_entity.h.s"
.include "man/man_game.h.s"


_x_antigua_hero: .db 0x00
_y_antigua_hero: .db 0x00
_x_antigua_bala: .db 0x00
_y_antigua_bala: .db 0x00

sys_collision_init::

	ret

;;INPUT-> IX-> array de entidades
;; 		A:: NUMERO DE ENTIDADES
sys_collision_update_hero::
	;;EMPEZAMOS IMPLEMENTANDO LAS COLISIONES DEL PERSONAJE (para fisicas)
 	;;push ix
 	;ld b, a ;;HACEMOS ESTO PARA EVITAR LLAMAR A GET ARRAY LUEGO
 	;;push af;;SI VOLVEMOS A LLAMAR DA PROBLEMAS CON EL MULTIPLAYER
 	;push bc
 	;ld__d_ixh
 	;ld__e_ixl
 	;push de



 	sub #01
	ld b, a ;; B = numero de entidades
	;;SI SOLO ES EL HEROE, no calculamos colisiones
	cp #0
	ret z
	;;pasamos a iy la entidad del heroe

	ld__d_ixh
	ld__e_ixl
	ld__iyh_d
	ld__iyl_e

	ld de, #sizeof_e
	add ix, de

;;Primero probamos moviento x e y
	ld a, e_x(iy)
	ld (_x_antigua_hero), a
	ld c, e_vx(iy)
	add c
	ld e_x(iy), a

	ld a, e_y(iy)
	ld (_y_antigua_hero), a
	ld c, e_vy(iy)
	add c
	ld e_y(iy), a

_update_loop:

	;;UNA VEZ HECHO ESO LLAMAMOS A COLLISION CHECK
	;;IY es el hero
	ld c, #00;;ponemos c a cero, si colisiona, pasara a ser 1
	call sys_collision_check
	
	;;SI YA HA COLISIONADO DEJAMOS DE BUSCAR:
	ld a, c
	sub #1
	jr z, _salir_x_y

	dec b
	jr z, _salir_x_y            ;;si no hay entidades acabamos 

	ld de, #sizeof_e
	add ix, de
	jr _update_loop

	;;si vx=0 ponemos la x antigua
_salir_x_y:

	;;AHORA PROBAMOS MOVIENDO SOLO LA 

	ld a, (_x_antigua_hero)
	ld e_x(iy), a
	ld a, (_y_antigua_hero)
	ld e_y(iy), a

	ld a, c
	sub #1
	jr nz, _no_colisiona

_si_colisiona_x_y:
	ld e_vy(iy), #00

	;;comprobamos si es entidad final
	ld a, e_final(ix)
	cp #01
	jr nz, _no_es_final 
	pop af
	call inc_level
	call start_game
_no_es_final:

	;;SI COLISIONA MOVIENDO X E Y, COmprobamos moviendo solo en X

	call man_entity_getArray
 	;pop de
 	;ld__ixh_d
 	;ld__ixl_e
 	;pop bc
 	;ld a, b


 	sub #01
	ld b, a ;; B = numero de entidades
	;;pasamos a iy la entidad del heroe
	ld__d_ixh
	ld__e_ixl
	ld__iyh_d
	ld__iyl_e

	ld de, #sizeof_e
	add ix, de

	;;Primero probamos moviento x e y
	ld a, e_x(iy)
	ld (_x_antigua_hero), a
	ld c, e_vx(iy)
	add c
	ld e_x(iy), a

_update_loop2:

	;;UNA VEZ HECHO ESO LLAMAMOS A COLLISION CHECK
	;;IY es el hero
	ld c, #00;;ponemos c a cero, si colisiona, pasara a ser 1
	call sys_collision_check
	
	;;SI YA HA COLISIONADO DEJAMOS DE BUSCAR:
	ld a, c
	sub #1
	jr z, _salir_x

	dec b
	jr z, _salir_x           ;;si no hay entidades acabamos 

	ld de, #sizeof_e
	add ix, de
	jr _update_loop2

_salir_x:

	ld a, (_x_antigua_hero)
	ld e_x(iy), a

	ld a, c
	sub #1
	jr nz, _no_colisiona
_si_colisiona_x:
	ld e_vx(iy), #00



_no_colisiona: 

	ret



;;INPUT:
;; IX -> entity 1
;; IY -> entity 2
;; RETURN:
;; c->1/si colisiona
sys_collision_check::
	;;heroe tiene un dos en colision
	;;comprobamos si iy es una bala que hace dmg al heroe
	ld a, e_bal(iy)
	cp #2
	jr nz,  no_heroe;;no es bala disparada por el heroe	

	ld a, e_col(ix);;comprobamos si es el heroe
	cp #4
	jr z, no_heroe

	ld a, e_col(ix);;comprobamos si es el heroe
	cp #3
	jr z, _no_collision

no_heroe:

	;;COMPROBAMOS SI EL OBJETO 2 ES COLISIONABLE O NO
	ld a, e_col(ix)
	cp #0
	jr z, _no_collision
	cp #2
	jr z, _no_collision

	;;COMPROBAMOS EN X
	;;SI A<B : no colisionan
	;; if (e_x(ix) + e_w(ix) < e_x(iy)) ->no colisiona
	;; if (e_x(ix) + e_w(ix) - e_x(iy) < 0) ->no colisiona

	ld a, e_x(ix)
	add e_w(ix)
	sub e_x(iy) ;;al hacer sub, si a < 0 -> el carry se activa
	jr c, _no_collision

	;;SI C<D : no colisionan
	;; if (e_x(iy) + e_w(iy) < e_x(ix)) ->no colisiona
	;; if (e_x(iy) + e_w(iy) - e_x(ix) < 0) ->no colisiona

	ld a, e_x(iy)
	add e_w(iy)
	sub e_x(ix)
	jr c, _no_collision


	;;;AHORA COMPROBAMOS EN Y

	ld a, e_y(ix)
	add e_h(ix)
	sub e_y(iy) ;;al hacer sub, si a < 0 -> el carry se activa
	jr c, _no_collision


	ld a, e_y(iy)
	add e_h(iy)
	sub e_y(ix)
	jr c, _no_collision

	ld c, #01 ;;C es el return, si es 1 ha colisionado

_no_collision:


	ret


;;INPUT-> IX-> array de entidades
;; 		A:: NUMERO DE ENTIDADES
sys_collision_update_dmg::
	
 	;;RECORREMOS TODOS LAS ENTIDADES MENOS LA PRIMERA(porque es el heroe, nunca va a ser dmg)
 	;;Si es dmg, comprobamos is colisiona con algo
 	sub #01
	ld b, a ;; B = numero de entidades

	ld de, #sizeof_e
	add ix, de

_update_loop_dmg: ;;ESTE BUCLE RECORRE LAS BALAS
	;;pasamos la bala a iy
	ld__d_ixh
	ld__e_ixl
	ld__iyh_d
	ld__iyl_e
	;;Comprobamos si hace dmg
	ld a, e_col(iy)
	sub #2
	jr nz, _salir_interior

	;;Modificamos x e y, guardando los originales
	ld a, e_x(iy)
	ld (_x_antigua_bala), a
	ld c, e_vx(iy)
	add c
	ld e_x(iy), a

	ld a, e_y(iy)
	ld (_y_antigua_bala), a
	ld c, e_vy(iy)
	add c
	ld e_y(iy), a

	;;pasamos al bucle que comprueba si colisiona
	call man_entity_getArray
	ld h, a;;Usamos h para recorrer el array
_update_loop_dmg_interior:

	ld c, #00;;ponemos c a cero, si colisiona, pasara a ser 1
	call sys_collision_check
	
	;Comprobamos si colisiona
	ld a, c
	sub #1
	jr nz, _no_colisiona_dmg

	ld a, #0
	call comprobarHeroEnemigo ;;nose porque no me deja poner el codigo aqui
	;;si colisiona ponemos bal a menos 1 , asi sabemos que hay que destruirla
	cp #3 ;;si a es 3 saltamos a no colisiona
	jr z, _no_colisiona_dmg
	;Si colisiona comprobamos si la entidad objetivo
	;;786B
	;;puede sufrir damage
	ld a, e_health(ix)
	cp #0
	jr z, _no_colisiona_dmg;;si es 0 no puede sufrir dmg

	;;Ahora restamos salud
	sub #1
	ld e_health(ix), a
	jr nz, _no_colisiona_dmg ;;si no es cero seguimos
	;;si es cero borramos la entidad
	push bc
	push hl
	;;pasamos ix a hl
	ld__b_ixh
	ld__c_ixl 
	ld h, b
	ld l, c
	call man_entity_delete
	pop hl
	pop bc
	

_no_colisiona_dmg:

	dec h
	jr z, _salir_interior            ;;si no hay entidades acabamos 

	ld de, #sizeof_e
	add ix, de
	jr _update_loop_dmg_interior

_salir_interior:


	;;volvemos a poner ix
	ld__d_iyh
	ld__e_iyl
	ld__ixh_d
	ld__ixl_e


	dec b
	jr z, _salir_exterior          ;;si no hay entidades acabamos 
	ld de, #sizeof_e
	add ix, de
	jr _update_loop_dmg

	;;si vx=0 ponemos la x antigua
_salir_exterior:

	call sys_collision_check_balas

	ret


comprobarHeroEnemigo:
	;;4580
	;;comprobamos si la bala hace dmg a enemigos
	ld a, e_bal(iy)
	cp #2
	jr z, _comprobarEnemigo ;;si es 2, comprobamos si el objeto con el que ha colisionado es enemigo
_comprobarHeroe:
	ld a, e_ai_st(ix)
	cp #e_ai_st_noAI ;;comparo la ia de la entidad con la de no AI
	jr z, _acabar_comprobacion;;si ai es 0 no es AI, salto, si no es NOAI es enemigo
	;ld e_bal(iy), #-1
	ld a, #3
	ret
_comprobarEnemigo:
	;;comprobamos si ix es enemigo, para eso probamos la IA
	ld a, e_ai_st(ix)
	cp #e_ai_st_noAI ;;comparo la ia de la entidad con la de no AI
	jr nz, _acabar_comprobacion;;si ai es 0 no es AI, salto, si no es NOAI es enemigo
	ld e_bal(iy), #-1
	ld a, #3
_acabar_comprobacion:

	ld e_bal(iy), #-1
	ret


;;ESTA funcion comprueba si hay que destruir alguna bala
sys_collision_check_balas::

	call man_entity_getArray

	ld (_ent_counter), a ;;guardo el contador en una variable

_update_loop3:

	ld a, e_bal(ix)
	add #1
	jr nz, _nada_check ;;SI es cero entoces bal es -1->eliminamos
_eliminar:
	;;pasamos IX a HL
	ld__d_ixh
	ld__e_ixl
	ex de, hl
	call man_entity_delete
;;volvemos a empezar el bucle para evitar errores(pero es mas lento)
	jr sys_collision_check_balas
_nada_check:
	
	_ent_counter = .+1 		;;estoy modificando el 0 con ent counter
	ld a, #0				;;codigo automodificable
	dec a
	ret z

	ld (_ent_counter), a
	ld bc, #sizeof_e
	add ix, bc
	jr _update_loop3



	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;PARA EL MULTIJUGADOR
;;COPIA PEGA DE LA PRIMERA
;;SE PUEDE HACER MUCHO MEJOR

;;INPUT-> IX-> array de entidades
;; 		A:: NUMERO DE ENTIDADES
sys_collision_update_hero2::
	;;EMPEZAMOS IMPLEMENTANDO LAS COLISIONES DEL PERSONAJE (para fisicas)


 	sub #01
	ld b, a ;; B = numero de entidades
	;;SI SOLO ES EL HEROE, no calculamos colisiones
	cp #0
	ret z
	;;pasamos a iy la entidad del heroe

	ld__d_ixh
	ld__e_ixl
	ld__iyh_d
	ld__iyl_e

	ld de, #sizeof_e
	add ix, de

;;Primero probamos moviento x e y
	ld a, e_x(iy)
	ld (_x_antigua_hero), a
	ld c, e_vx(iy)
	add c
	ld e_x(iy), a

	ld a, e_y(iy)
	ld (_y_antigua_hero), a
	ld c, e_vy(iy)
	add c
	ld e_y(iy), a

_update_loop21:

	;;UNA VEZ HECHO ESO LLAMAMOS A COLLISION CHECK
	;;IY es el hero
	ld c, #00;;ponemos c a cero, si colisiona, pasara a ser 1
	call sys_collision_check
	
	;;SI YA HA COLISIONADO DEJAMOS DE BUSCAR:
	ld a, c
	sub #1
	jr z, _salir_x_y21

	dec b
	jr z, _salir_x_y21            ;;si no hay entidades acabamos 

	ld de, #sizeof_e
	add ix, de
	jr _update_loop21

	;;si vx=0 ponemos la x antigua
_salir_x_y21:

	;;AHORA PROBAMOS MOVIENDO SOLO LA 

	ld a, (_x_antigua_hero)
	ld e_x(iy), a
	ld a, (_y_antigua_hero)
	ld e_y(iy), a

	ld a, c
	sub #1
	jr nz, _no_colisiona21

_si_colisiona_x_y21:
	ld e_vy(iy), #00

	;;comprobamos si es entidad final
	ld a, e_final(ix)
	cp #01
	jr nz, _no_es_final21 
	pop af
	call inc_level
	call start_game
_no_es_final21:

	call man_entity_getArray
	ld bc, #sizeof_e
	add ix, bc
	dec a

 	sub #01
	ld b, a ;; B = numero de entidades
	;;pasamos a iy la entidad del heroe
	ld__d_ixh
	ld__e_ixl
	ld__iyh_d
	ld__iyl_e

	ld de, #sizeof_e
	add ix, de

	;;Primero probamos moviento x e y
	ld a, e_x(iy)
	ld (_x_antigua_hero), a
	ld c, e_vx(iy)
	add c
	ld e_x(iy), a

_update_loop221:

	;;UNA VEZ HECHO ESO LLAMAMOS A COLLISION CHECK
	;;IY es el hero
	ld c, #00;;ponemos c a cero, si colisiona, pasara a ser 1
	call sys_collision_check
	
	;;SI YA HA COLISIONADO DEJAMOS DE BUSCAR:
	ld a, c
	sub #1
	jr z, _salir_x21

	dec b
	jr z, _salir_x21           ;;si no hay entidades acabamos 

	ld de, #sizeof_e
	add ix, de
	jr _update_loop221

_salir_x21:

	ld a, (_x_antigua_hero)
	ld e_x(iy), a

	ld a, c
	sub #1
	jr nz, _no_colisiona21
_si_colisiona_x21:
	ld e_vx(iy), #00



_no_colisiona21: 

	ret