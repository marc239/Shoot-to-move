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


;;;ENTITY COMPONENT

.macro DefineCmp_Entity _x, _y, _vx, _vy, _w, _h, _pspr, _aist, _col, _bal, _health, _mapa, _final
	.db _x, _y
	.db _vx, _vy
	.db _w, _h
	.dw _pspr
	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
	.db _col ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
	.db _bal
	.db _health ;;entidades con salud = 0-> entidades que no sufren dmg
	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
	.db _aist 		;;AI - Status
	.db _aist
	.db 0x00
	.db _mapa ;;0->  es mapa 1-> NO es mapa 
	.db _final
	.dw 0x0000			;; AI puntero a patrulla step
	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
.endm

e_x = 0
e_y = 1
e_vx = 2
e_vy = 3
e_w = 4
e_h = 5
e_pspr_l = 6
e_pspr_h = 7
e_prim = 8
e_col = 9 ;; 0 = no colisiona, 1 = collision, 2 = hace damage
e_bal = 10	;;1->hace dmg al heroe ;;2->hace dmg a los enemigos
e_health = 11
e_ai_aim_x = 12
e_ai_aim_y = 13
e_ai_st = 14
e_ai_pre_st = 15
e_ai_contador = 16
e_mapa = 17
e_final = 18
e_ai_patrol_step_l = 19
e_ai_patrol_step_h = 20
e_lastVP_l = 21
e_lastVP_h = 22	
sizeof_e = 23
sizeof_e_neg = -23

;;ENTITY AI STATUS ENUM

e_ai_st_noAI = 0
e_ai_st_stand_by = 1
e_ai_st_move_to = 2
e_ai_st_patrol = 3
e_ai_st_noAIMulti = 4 ;;se utiliza para que las colisiones de balas funcionen en multijugador


;;COLISION STATUS
e_col_no = 0
e_col_si = 1
e_col_dmg = 2



.macro DefineCmp_Entity_default
	DefineCmp_Entity 0, 0, 0, 0, 1, 1, 0x0000, e_ai_st_noAI, 0, 0, 0, 1, 0
.endm