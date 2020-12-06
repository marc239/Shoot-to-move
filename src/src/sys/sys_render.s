;; This file is part of SHOOT TO MOVE
;;  Copyright (C) 2020 Marc Landes Molla
;;
;;     SHOOT TO MOVEis free software: you can redistribute it and/or modify
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

;; SYSTEMA DE RENDER

.include "main.h.s"
.include "cmp/entity.h.s"
.include "man/man_entity.h.s"
.include "cpctelera.h.s"
.include "main.h.s"
.include "assets/assets.h.s"
.include "cmp"


.module sys_entity_render




;screen_start = 0xC000




sys_eren_init::

	ld c, #0
	call cpct_setVideoMode_asm ;;pone el modo de video a cero
	ld hl, #_main_pal
	ld de, #16
	call cpct_setPalette_asm
	;cpctm_setBorder_asm HW_WHITE ;;cambio el color del borde

	;;LIMPIAMOS LA MEMORIA DE VIDEO
	cpctm_clearScreen_asm #00

	;ld de, #0xC000
	;ld a, #0xFF
	;ld c, #64 ;;ANCHURA
	;ld b, #200
	;call cpct_drawSolidBox_asm


	ret



;;UPDATE
;;INPUT:
;;  IX = Puntero al array de entidades
;; A = Numero de elementos en el array

sys_eren_update::

	call sys_eren_render_entities

	ret


;;RENDER ENTITIES
;;INPUT:
;;  IX = Puntero al array de entidades
;; A = Numero de elementos en el array
sys_eren_render_entities::

	ld (_ent_counter), a ;;guardo el contador en una variable

_update_loop:

	;;COMPROBAMOS QUE EL ITEM ES MAPA
	;; SI ES =0 MAPA TODAVIA POR PINTAR
	;; SI ES -1 es mapa que ya se ha pintado
	;; si es 1 es elemento normal
	push af
	
	ld a, e_mapa(ix)
	sub #1
	jr z,_es_uno ;;Si es cero (mapa=1)-> elemento normal
	ld a, e_mapa(ix)
	add #1
	jr z, _es_menos_uno ;;si es cero, antes era menos 1 -> no pintamos
_es_cero:
	ld a, #-1
	ld e_mapa(ix), a
	jr _es_uno
_es_menos_uno:
	pop af
	jr _final_menos_uno

_es_uno:
	pop af

	ld e, e_lastVP_l(ix)
	ld d, e_lastVP_h(ix)
	;;xor a ;;ponemos a 0 a para pintar en color de fondo
	ld c, e_w(ix)
	ld b, e_h(ix)
	ld h, e_pspr_h(ix)
	ld l, e_pspr_l(ix)
	push bc
	ld a, #00
	call cpct_drawSolidBox_asm
	;call cpct_drawSpriteBlended_asm	;;pinto sobre el sprite anterior
	;;AL APLICAR DOS XOR SE VUELVE AL FONDO ORIGINAL (SE BORRA EL SPRITE

	;;calculamos el puntero de la posicion actual
	ld de, #0xC000
	ld c, e_x(ix)
	ld b, e_y(ix)
	call cpct_getScreenPtr_asm

	;;guardamos el nuevo puntero de memoria para borrar luego

	ld e_lastVP_l(ix), l
	ld e_lastVP_h(ix), h	

	;;Draw entity sprite
	
	ex de, hl
	ld l, e_pspr_l(ix)
	ld h, e_pspr_h(ix)
	pop bc
	call cpct_drawSprite_asm		;;pintamos el sprite en el lugar correcto
	;;call cpct_drawSpriteBlended_asm

_final_menos_uno:

	_ent_counter = .+1 		;;estoy modificando el 0 con ent counter
	ld a, #0				;;codigo automodificable
	dec a
	ret z

	ld (_ent_counter), a
	ld bc, #sizeof_e
	add ix, bc
	jr _update_loop


;;BORRA ELEMENTOS
;;INPUT IX-> entidad a borrar
sys_eren_borrar::
	ld e, e_lastVP_l(ix)
	ld d, e_lastVP_h(ix)
	;;xor a ;;ponemos a 0 a para pintar en color de fondo
	ld b, e_w(ix)
	ld c, e_h(ix)
	ld h, e_pspr_h(ix)
	ld l, e_pspr_l(ix)
	call cpct_drawSpriteBlended_asm	;;pinto sobre el sprite anterior
	
	ret