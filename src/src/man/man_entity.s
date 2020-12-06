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

 ;;ENTITY MANAGER
.include "cpctelera.h.s"
.include "cmp/array_structure.h.s"
.include "cmp/entity.h.s"
.include "sys/sys_physics.h.s"
.include "sys/sys_render.h.s"
.include "sys/sys_input.h.s"
.include "man/man_entity.h.s"
.include "assets/assets.h.s"


 .module entity_manager
max_entities = 20

_bala: DefineCmp_Entity 0, 0, 0, 0, 2, 4, _sp_bala,  e_ai_st_noAI, 2, 1, 2, 1, 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Genera todo
DefineComponentArrayStructure _entity, max_entities, DefineCmp_Entity_default
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;DEVUELVE: 
	;IX: puntero al array de entidades
	;A: Numero de entidades
man_entity_getArray::
	ld ix, #_entity_array
	ld a, (_entity_num)
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DEVUELVE en HL el puntero al array de entidades
man_entity_init::
	
	xor a 				;;xor a,a pone el registro A a cero
	ld (_entity_num), a

	ld hl, #_entity_array
	ld (_entity_pend), hl ;;ponemos la ultima entidad al principio del array

	ret

	;;RETURN
	;; IX: Puntero al elemento añadido
	;; BC: SizeOF (Entity_t)
man_entity_new::

	;;Aumentamos el numero de entidades
	ld hl, #_entity_num
	inc (hl)


	ld hl, (_entity_pend)
	ld d, h
	ld e, l
	ld bc, #sizeof_e
	add hl, bc
	ld (_entity_pend), hl

	ret

	;;CREA ENTIDADES
	;; INPUT:
	;; HL-> puntero al inicializador de los valores
	;; IX-> Lugar donde se va a iniciar
man_entity_create::

	push hl 	;;guardo el puntero a valores iniciales
	call man_entity_new

	;;Paso el nuevo sitio donde tengo que copiar de ix a de
	ld__ixh_d  ;;INTRUCCIONES NO DOCUMENTADAS
	ld__ixl_e


	pop hl
	ldir			;;COPIO

	ret

;;DELETE	
;;INPUT->hl puntero a la entidad a eliminar
;;DESTROYS-> de, bc, hl
man_entity_delete::

	;;copio lo de la ultima entidad a la que quiero borrar
	;; a continuacion bajo el puntero de ultima entidad y el num de entidades
	;;faltaria borrar la entidad
	
	;;COMPROBAMOS QUE NO ES LA PRIMERA ENTIDAD
	ld a, e_col(ix);;comprobamos si es el heroe
	cp #3
	ret z

	
	;;COMPROBAMOS QUE NO ES UNA ENTIDAD DE MAPA
	push hl
	push bc
	ld bc, #e_mapa
	add hl, bc
	ld a, (hl)
	pop bc
	pop hl
	cp #0
	ret z

	;;LDIR COPIA HL EN DE
	push hl
	;;AHORA DIBUJAMOS ENCIMA
	call sys_eren_borrar
	pop hl

	ld d, h
	ld e, l

	ld bc, #sizeof_e

	ld hl, (_entity_pend)
	ld bc, #sizeof_e_neg
	add hl, bc
	ld bc, #sizeof_e

	ldir ;;copiamos la ultima entidad en la eliminada

	;;quitamos la ultima

	ld hl, (_entity_pend)
	ld bc, #sizeof_e_neg
	add hl, bc
	ld (_entity_pend), hl

	ld hl, #_entity_num
	dec (hl)

	ret

_pos_bala: .dw 0x0000

;;INPUT 
;; b> 0: y arriba
;;  	1: x derecha
;; 	2: x izquierda
;;	3: y abajo 
;; d-> x donde se debe crear
;; e -> y donde se debe crear
;; c-> 1: bala hace dmg a enemigos
;;	0: bala hace dmg a heroe
;;DESTROYS -> IX
man_entity_crearBala::
	;;POR DEFECTO ES 1 (HACE DMG a heroe)
	;;si c es 1 ponemos en e_bal 0

	ld ix, #_bala
	ld e_bal(ix), #1
	ld a, d
	inc a
	ld e_x(ix), a
	ld a, e
	add #6
	ld e_y(ix), a

	ld a, c
	cp #1
	jr nz, _hace_dmg_a_heroe
_hace_dmg_a_enemigos:	
	ld e_bal(ix),#2
_hace_dmg_a_heroe:

	ld hl, #_bala
	push bc
	call man_entity_create
	;;AHORA IX ES LA SIGUIENTE ENTIDAD, por la tanto restamos una
	;ld bc, #sizeof_e_neg
	;add ix, bc
	pop bc
	;;cambiamos la velocidad de la bala
	ld a, b
	cp #0
	jr nz, no0
disparar_abajo:
	ld e_vy(ix), #-2
	jr nada
no0:
	cp #3
	jr nz, no3
disparar_arriba:
	ld e_vy(ix), #2
	jr nada
no3:

	cp #1
	jr z, disparar_derecha
disparar_izquierda:	
	ld e_vx(ix), #1
	jr nada
disparar_derecha:
	ld e_vx(ix), #-1
nada:


	ret

