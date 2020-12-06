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

;;SYSTEM THAT CONTROLS DASH 
.include "cpctelera.h.s"
.include "main.h.s"
.include "cmp/entity.h.s"


;;INPUT->
;; IX: puntero al personaje
sys_dash_update::

	ld a, e_vx(ix);
	cp #0
	jr z, vx_parado
	jp m, vx_negativo
vx_positivo:

	ld b, #-1
	add a, b

	ld e_vx(ix), a
	jr vx_parado

vx_negativo:

	ld b, #1
	add a, b

	ld e_vx(ix), a

	;;SI VX ES POSITIVO-> restar 2 a vx
	;:SI VX es negativo -> sumar 2 a vx
vx_parado:

;;PASAMOS A LA PARTE DE VY

	ld a, e_vy(ix)
	sub #4 ;;restamos 4 si 
	jr z, vy_seguirCayendo

	add #5
	ld e_vy(ix), a


vy_seguirCayendo:

	ret;

