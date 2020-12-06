ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;; This file is part of SHOOT TO MOVE
                              2 ;;  Copyright (C) 2020 Marc Landes Molla
                              3 ;;
                              4 ;;     SHOOT TO MOVE is free software: you can redistribute it and/or modify
                              5 ;;     it under the terms of the GNU General Public License as published by
                              6 ;;     the Free Software Foundation, either version 3 of the License, or
                              7 ;;     (at your option) any later version.
                              8 ;; 
                              9 ;;     SHOOT TO MOVE is distributed in the hope that it will be useful,
                             10 ;;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                             11 ;;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             12 ;;     GNU General Public License for more details.
                             13 ;; 
                             14 ;;     You should have received a copy of the GNU General Public License
                             15 ;;     along with SHOOT TO MOVE  If not, see <https://www.gnu.org/licenses/>.
                             16 
                             17 
                             18 ;;;ENTITY COMPONENT
                             19 
                             20 .macro DefineCmp_Entity _x, _y, _vx, _vy, _w, _h, _pspr, _aist, _col, _bal, _health, _mapa, _final
                             21 	.db _x, _y
                             22 	.db _vx, _vy
                             23 	.db _w, _h
                             24 	.dw _pspr
                             25 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
                             26 	.db _col ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
                             27 	.db _bal
                             28 	.db _health ;;entidades con salud = 0-> entidades que no sufren dmg
                             29 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
                             30 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
                             31 	.db _aist 		;;AI - Status
                             32 	.db _aist
                             33 	.db 0x00
                             34 	.db _mapa ;;0->  es mapa 1-> NO es mapa 
                             35 	.db _final
                             36 	.dw 0x0000			;; AI puntero a patrulla step
                             37 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             38 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                             39 .endm
                             40 
                     0000    41 e_x = 0
                     0001    42 e_y = 1
                     0002    43 e_vx = 2
                     0003    44 e_vy = 3
                     0004    45 e_w = 4
                     0005    46 e_h = 5
                     0006    47 e_pspr_l = 6
                     0007    48 e_pspr_h = 7
                     0008    49 e_prim = 8
                     0009    50 e_col = 9 ;; 0 = no colisiona, 1 = collision, 2 = hace damage
                     000A    51 e_bal = 10	;;1->hace dmg al heroe ;;2->hace dmg a los enemigos
                     000B    52 e_health = 11
                     000C    53 e_ai_aim_x = 12
                     000D    54 e_ai_aim_y = 13
                     000E    55 e_ai_st = 14
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                     000F    56 e_ai_pre_st = 15
                     0010    57 e_ai_contador = 16
                     0011    58 e_mapa = 17
                     0012    59 e_final = 18
                     0013    60 e_ai_patrol_step_l = 19
                     0014    61 e_ai_patrol_step_h = 20
                     0015    62 e_lastVP_l = 21
                     0016    63 e_lastVP_h = 22	
                     0017    64 sizeof_e = 23
                     FFFFFFE9    65 sizeof_e_neg = -23
                             66 
                             67 ;;ENTITY AI STATUS ENUM
                             68 
                     0000    69 e_ai_st_noAI = 0
                     0001    70 e_ai_st_stand_by = 1
                     0002    71 e_ai_st_move_to = 2
                     0003    72 e_ai_st_patrol = 3
                     0004    73 e_ai_st_noAIMulti = 4 ;;se utiliza para que las colisiones de balas funcionen en multijugador
                             74 
                             75 
                             76 ;;COLISION STATUS
                     0000    77 e_col_no = 0
                     0001    78 e_col_si = 1
                     0002    79 e_col_dmg = 2
                             80 
                             81 
                             82 
                             83 .macro DefineCmp_Entity_default
                             84 	DefineCmp_Entity 0, 0, 0, 0, 1, 1, 0x0000, e_ai_st_noAI, 0, 0, 0, 1, 0
                             85 .endm
