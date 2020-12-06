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

;;;THIS MANAGER CONTROLS IF THE PLAYER PRESSES ESC
.include "main.h.s"
.include "cpctelera.h.s"


man_escape_update::

	call cpct_scanKeyboard_f_asm

	ld hl, #Key_Esc
	call cpct_isKeyPressed_asm
	ret z;; Esc_NotPressed
Esc_Pressed:


	jp _main