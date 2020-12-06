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

;;
;; PATROL MANAGER
;;
.include "man/man_patrol.h.s"
.include "cmp/entity.h.s"


_patrol_01:
	.db 6, 6
	.db 6, 60
	.db 60, 60
	.db 60, 6
	.db patrol_invalid_move_x
	.dw _patrol_01

_patrol_02:
	.db 40, 10
	.db 30, 130
	.db 70, 150
	.db 60, 90
	.db 10, 40
	.db patrol_invalid_move_x
	.dw _patrol_02



;;DEVUELVE LA PATRULLA EN HL
;;INPUT -> A = numero de patrulla (1,2,3,000)
man_patrol_get::

	or a
	jr nz, _p2
_p1: 
	ld hl, #_patrol_01
	ret
_p2: 
	ld hl, #_patrol_02
	ret

man_patrol_init::

	ret