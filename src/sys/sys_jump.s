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

;; SISTEMA DE SALTO

.include "cpctelera.h.s"
.include "main.h.s"
.include "cmp/entity.h.s"


;;INPUT A TODAS:
;; IX -> entidad del personaje

_tabla_salto:
	.db #-3, #-4, #-4, #-3, #-3, #-2, #-2, #0, #1, #1, #2, #2, #3, #3, #10
_momento_salto:
	.db #00

longitud_salto = 13


sys_jump_start::

	ld a, (_momento_salto)
	;cp #00
	;jr nz, _ya_saltando
	ld a, #01
	ld (_momento_salto), a ;;PONEMOS EL MOMENTO DE SALTO A UNO

_ya_saltando:

	ret

sys_jump_control::

	ld a, (_momento_salto) ;;cargamos el momento del salto
	cp #00
	jr z, _acabado ;;si no esta saltando no hacemos nada
	

	ld hl, #_tabla_salto ;;cargamos la posicion de la tabla en hl
	ld b, #00
	ld c, a

	add hl, bc ;;vamos a la posicion correcta de la tabla

	ld b, (hl) ;;cargamos en b la velocidad correcta
	ld e_vy(ix), b ;;ponemos la velocidad en la entidad

	cp #14
	jr z, _acabado

	inc a
	ld (_momento_salto), a ;;incrementamos el momento de salto
	
	ret

_acabado:

	ret

sys_jump_stop::

	ld a, #00
	ld (_momento_salto), a

	ret