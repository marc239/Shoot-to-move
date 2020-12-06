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

.include "cpctelera.h.s"
.include "main.h.s"
.include "man/man_entity.h.s"
.include "cmp/entity.h.s"

.module sys_entity_physics

;;PHYSICS SYSTEM

;;Constantes
screen_width = 80
screen_height = 200

x_antigua: .db 0x00

sys_physics_init::
	ret


;;SYS_PHYSICS::UPDATE
;; INPUT:
;; IX: Puntero al array de entidades
;; A: Elementos en el array

sys_physics_update::

	ld b, a ;; B = numero de entidades

_update_loop:

	ld a, #screen_width + 1   ;;tenemos en cuenta el ancho para los limites
	sub e_w(ix)
	ld c, a

	ld a, e_x(ix)
	add e_vx(ix)
	cp c
	jr nc, invalid_x ;;comprueba que la posicion es correcta
	;;DE MOMENTO COMPROBAMOS TODAS LAS COLISIONES
valid_x:
		ld e_x(ix), a
		jr endif_x
invalid_x:	
		;;ld a, e_vx(ix)
		;;COMPROBAMOS SI es una bala
		ld a, e_bal(ix)
		cp #0
		jr z, endif_x ;;si no es bala seguimos
		;;SI ES UNA BALA LA DESTRUIMOS
		push bc
		push de
		ld__d_ixh
		ld__e_ixl
		ld h, d
		ld l, e
		call man_entity_delete
		pop de
		pop bc
endif_x:

	ld a, #screen_height + 1   ;;tenemos en cuenta el ancho para los limites
	sub e_h(ix)
	ld c, a

	ld a, e_y(ix)
	add e_vy(ix)
	cp c
	jr nc, invalid_y ;;comprueba que la posicion es correcta
valid_y:
		ld e_y(ix), a
		jr endif_y
invalid_y:	
		;ld a, e_vy(ix)
		;neg
		;ld e_vy(ix), a ;; no te mueves
		
		ld a, e_bal(ix)
		cp #0
		jr z, endif_y ;;si no es bala seguimos
		;;SI ES UNA BALA LA DESTRUIMOS
		push bc
		push de
		ld__d_ixh
		ld__e_ixl
		ld h, d
		ld l, e
		call man_entity_delete
		pop de
		pop bc
endif_y:

	dec b
	ret z             ;;si no hay entidades acabamos 

	ld de, #sizeof_e
	add ix, de
	jr _update_loop
