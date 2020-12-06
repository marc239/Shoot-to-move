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

;;ESTE SISTEMA COMPRUEBA SI EL PERSONAJE A MUERTO

.include "cpctelera.h.s"
.include "cmp/entity.h.s"
.include "main.h.s"


;;INPUT:
;;	ix->puntero al array de entidades
sys_death_update::

	;;comprobamos si health del heroe es 0
	ld b, #0
	ld a, e_health(ix)
	cp #0
	ret nz	;;si la salud no es cero hacemos ret
	ld b, #0
	;;si la salud es 0 saltamos al menu de restart
	jp menu_restart

	
;;INPUT:
;;	ix->puntero al array de entidades
sys_death_update_multi::

	;;comprobamos si health del heroe es 0
	ld b, #1
	ld a, e_health(ix)
	cp #0
	jp z, menu_restart	;;si la salud no es cero hacemos ret

	ld bc, #sizeof_e
	add ix, bc
	ld a, e_health(ix)
	cp #0
	ret nz

	ld b,#2
	;;si la salud es 0 saltamos al menu de restart
	jp menu_restart

	