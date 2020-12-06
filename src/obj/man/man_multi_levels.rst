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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             17 .include "man/man_game.h.s"
                              1 .globl man_game_init
                              2 .globl  man_game_update
                              3 .globl man_game_render
                              4 .globl man_game_update_multi
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                             18 .include "man/man_entity.h.s"
                              1 .globl man_entity_init
                              2 .globl man_entity_create
                              3 .globl man_entity_getArray
                              4 .globl man_entity_delete
                              5 .globl man_entity_crearBala
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                             19 .include "sys/sys_render.h.s"
                              1 .globl sys_eren_init
                              2 .globl sys_eren_update
                              3 .globl sys_eren_borrar
                              4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                             20 .include "cmp/entity.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                     000E    55 e_ai_st = 14
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



                             21 .include "assets/assets.h.s"
                              1 .globl _sp_mainchar
                              2 .globl _sp_redball
                              3 .globl _sp_sword
                              4 .globl _main_pal
                              5 .globl _sp_bala
                              6 .globl _sp_plat
                              7 .globl _sp_platV30
                              8 .globl _sp_final
                              9 .globl _sp_rojo
                             10 .globl _sp_rojo_grande
                             11 .globl _sp_restart
                             12 .globl _sp_char_multi1
                             13 .globl _sp_char_multi2
                             14 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                             22 
                             23 ;;ALL MUTLIPLAYER LEVELS
                             24 
   0000                      25 level1_multi_ent1: DefineCmp_Entity 0, 150, 0, 0, 4, 16, _sp_char_multi1, e_ai_st_noAI, 3, 0, 1, 1, 0
   7C3C 00 96                 1 	.db 0, 150
   7C3E 00 00                 2 	.db 0, 0
   7C40 04 10                 3 	.db 4, 16
   7C42 04 75                 4 	.dw _sp_char_multi1
   7C44 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7C45 03                    6 	.db 3 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7C46 00                    7 	.db 0
   7C47 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7C48 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7C4A 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7C4B 00                   12 	.db e_ai_st_noAI
   7C4C 00                   13 	.db 0x00
   7C4D 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   7C4E 00                   15 	.db 0
   7C4F 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7C51 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0017                      26 level1_multi_ent2: DefineCmp_Entity 74, 150, 0, 0, 4, 16, _sp_char_multi2, e_ai_st_noAIMulti, 4, 0, 1, 1, 0
   7C53 4A 96                 1 	.db 74, 150
   7C55 00 00                 2 	.db 0, 0
   7C57 04 10                 3 	.db 4, 16
   7C59 B4 74                 4 	.dw _sp_char_multi2
   7C5B 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7C5C 04                    6 	.db 4 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7C5D 00                    7 	.db 0
   7C5E 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7C5F 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7C61 04                   11 	.db e_ai_st_noAIMulti 		;;AI - Status
   7C62 04                   12 	.db e_ai_st_noAIMulti
   7C63 00                   13 	.db 0x00
   7C64 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   7C65 00                   15 	.db 0
   7C66 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7C68 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   002E                      27 level1_multi_ent3: DefineCmp_Entity 30, 170, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   7C6A 1E AA                 1 	.db 30, 170
   7C6C 00 00                 2 	.db 0, 0
   7C6E 02 1E                 3 	.db 2, 30
   7C70 C8 71                 4 	.dw _sp_platV30
   7C72 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7C73 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7C74 00                    7 	.db 0
   7C75 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7C76 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7C78 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7C79 00                   12 	.db e_ai_st_noAI
   7C7A 00                   13 	.db 0x00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   7C7B 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7C7C 00                   15 	.db 0
   7C7D 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7C7F CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0045                      28 level1_multi_ent4: DefineCmp_Entity 50, 170, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   7C81 32 AA                 1 	.db 50, 170
   7C83 00 00                 2 	.db 0, 0
   7C85 02 1E                 3 	.db 2, 30
   7C87 C8 71                 4 	.dw _sp_platV30
   7C89 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7C8A 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7C8B 00                    7 	.db 0
   7C8C 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7C8D 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7C8F 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7C90 00                   12 	.db e_ai_st_noAI
   7C91 00                   13 	.db 0x00
   7C92 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7C93 00                   15 	.db 0
   7C94 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7C96 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                             29 ;;final
                             30 
   7C98                      31 man_level1_multi_init::
                             32 
   7C98 21 3C 7C      [10]   33 	ld hl, #level1_multi_ent1
   7C9B CD F7 8D      [17]   34 	call man_entity_create
   7C9E CD 6A 7B      [17]   35 	call sys_eren_borrar	
   7CA1 21 53 7C      [10]   36 	ld hl, #level1_multi_ent2
   7CA4 CD F7 8D      [17]   37 	call man_entity_create
   7CA7 21 6A 7C      [10]   38 	ld hl, #level1_multi_ent3
   7CAA CD F7 8D      [17]   39 	call man_entity_create
   7CAD 21 81 7C      [10]   40 	ld hl, #level1_multi_ent4
   7CB0 CD F7 8D      [17]   41 	call man_entity_create
                             42 
   7CB3 C9            [10]   43 	ret
                             44 
   0078                      45 level2_multi_ent1: DefineCmp_Entity 0, 150, 0, 0, 4, 16, _sp_char_multi1, e_ai_st_noAI, 3, 0, 1, 1, 0
   7CB4 00 96                 1 	.db 0, 150
   7CB6 00 00                 2 	.db 0, 0
   7CB8 04 10                 3 	.db 4, 16
   7CBA 04 75                 4 	.dw _sp_char_multi1
   7CBC 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7CBD 03                    6 	.db 3 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7CBE 00                    7 	.db 0
   7CBF 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7CC0 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7CC2 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7CC3 00                   12 	.db e_ai_st_noAI
   7CC4 00                   13 	.db 0x00
   7CC5 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   7CC6 00                   15 	.db 0
   7CC7 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7CC9 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   008F                      46 level2_multi_ent2: DefineCmp_Entity 74, 150, 0, 0, 4, 16, _sp_char_multi2, e_ai_st_noAIMulti, 4, 0, 1, 1, 0
   7CCB 4A 96                 1 	.db 74, 150
   7CCD 00 00                 2 	.db 0, 0
   7CCF 04 10                 3 	.db 4, 16
   7CD1 B4 74                 4 	.dw _sp_char_multi2
   7CD3 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7CD4 04                    6 	.db 4 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7CD5 00                    7 	.db 0
   7CD6 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7CD7 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7CD9 04                   11 	.db e_ai_st_noAIMulti 		;;AI - Status
   7CDA 04                   12 	.db e_ai_st_noAIMulti
   7CDB 00                   13 	.db 0x00
   7CDC 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   7CDD 00                   15 	.db 0
   7CDE 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7CE0 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   00A6                      47 level2_multi_ent3: DefineCmp_Entity 39, 70, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   7CE2 27 46                 1 	.db 39, 70
   7CE4 00 00                 2 	.db 0, 0
   7CE6 02 1E                 3 	.db 2, 30
   7CE8 C8 71                 4 	.dw _sp_platV30
   7CEA 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7CEB 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7CEC 00                    7 	.db 0
   7CED 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7CEE 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7CF0 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7CF1 00                   12 	.db e_ai_st_noAI
   7CF2 00                   13 	.db 0x00
   7CF3 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7CF4 00                   15 	.db 0
   7CF5 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7CF7 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   00BD                      48 level2_multi_ent4: DefineCmp_Entity 25, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   7CF9 19 64                 1 	.db 25, 100
   7CFB 00 00                 2 	.db 0, 0
   7CFD 0F 08                 3 	.db 15, 8
   7CFF B4 73                 4 	.dw _sp_plat
   7D01 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7D02 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7D03 00                    7 	.db 0
   7D04 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7D05 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7D07 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7D08 00                   12 	.db e_ai_st_noAI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   7D09 00                   13 	.db 0x00
   7D0A 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7D0B 00                   15 	.db 0
   7D0C 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7D0E CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   00D4                      49 level2_multi_ent5: DefineCmp_Entity 10, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   7D10 0A 64                 1 	.db 10, 100
   7D12 00 00                 2 	.db 0, 0
   7D14 0F 08                 3 	.db 15, 8
   7D16 B4 73                 4 	.dw _sp_plat
   7D18 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7D19 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7D1A 00                    7 	.db 0
   7D1B 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7D1C 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7D1E 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7D1F 00                   12 	.db e_ai_st_noAI
   7D20 00                   13 	.db 0x00
   7D21 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7D22 00                   15 	.db 0
   7D23 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7D25 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   00EB                      50 level2_multi_ent6: DefineCmp_Entity 40, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   7D27 28 64                 1 	.db 40, 100
   7D29 00 00                 2 	.db 0, 0
   7D2B 0F 08                 3 	.db 15, 8
   7D2D B4 73                 4 	.dw _sp_plat
   7D2F 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7D30 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7D31 00                    7 	.db 0
   7D32 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7D33 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7D35 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7D36 00                   12 	.db e_ai_st_noAI
   7D37 00                   13 	.db 0x00
   7D38 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7D39 00                   15 	.db 0
   7D3A 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7D3C CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0102                      51 level2_multi_ent7: DefineCmp_Entity 39, 108, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   7D3E 27 6C                 1 	.db 39, 108
   7D40 00 00                 2 	.db 0, 0
   7D42 02 1E                 3 	.db 2, 30
   7D44 C8 71                 4 	.dw _sp_platV30
   7D46 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7D47 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7D48 00                    7 	.db 0
   7D49 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7D4A 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   7D4C 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7D4D 00                   12 	.db e_ai_st_noAI
   7D4E 00                   13 	.db 0x00
   7D4F 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7D50 00                   15 	.db 0
   7D51 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7D53 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0119                      52 level2_multi_ent8: DefineCmp_Entity 55, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   7D55 37 64                 1 	.db 55, 100
   7D57 00 00                 2 	.db 0, 0
   7D59 0F 08                 3 	.db 15, 8
   7D5B B4 73                 4 	.dw _sp_plat
   7D5D 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7D5E 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7D5F 00                    7 	.db 0
   7D60 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7D61 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7D63 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7D64 00                   12 	.db e_ai_st_noAI
   7D65 00                   13 	.db 0x00
   7D66 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7D67 00                   15 	.db 0
   7D68 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7D6A CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                             53 
                             54 ;;final
                             55 
   7D6C                      56 man_level2_multi_init::
                             57 
   7D6C 21 B4 7C      [10]   58 	ld hl, #level2_multi_ent1
   7D6F CD F7 8D      [17]   59 	call man_entity_create
   7D72 CD 6A 7B      [17]   60 	call sys_eren_borrar	
   7D75 21 CB 7C      [10]   61 	ld hl, #level2_multi_ent2
   7D78 CD F7 8D      [17]   62 	call man_entity_create
   7D7B 21 E2 7C      [10]   63 	ld hl, #level2_multi_ent3
   7D7E CD F7 8D      [17]   64 	call man_entity_create
   7D81 21 F9 7C      [10]   65 	ld hl, #level2_multi_ent4
   7D84 CD F7 8D      [17]   66 	call man_entity_create
   7D87 21 10 7D      [10]   67 	ld hl, #level2_multi_ent5
   7D8A CD F7 8D      [17]   68 	call man_entity_create
   7D8D 21 27 7D      [10]   69 	ld hl, #level2_multi_ent6
   7D90 CD F7 8D      [17]   70 	call man_entity_create
   7D93 21 3E 7D      [10]   71 	ld hl, #level2_multi_ent7
   7D96 CD F7 8D      [17]   72 	call man_entity_create
   7D99 21 55 7D      [10]   73 	ld hl, #level2_multi_ent8
   7D9C CD F7 8D      [17]   74 	call man_entity_create
                             75 
   7D9F C9            [10]   76 	ret
                             77 
   0164                      78 level3_multi_ent1: DefineCmp_Entity 0, 150, 0, 0, 4, 16, _sp_char_multi1, e_ai_st_noAI, 3, 0, 1, 1, 0
   7DA0 00 96                 1 	.db 0, 150
   7DA2 00 00                 2 	.db 0, 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   7DA4 04 10                 3 	.db 4, 16
   7DA6 04 75                 4 	.dw _sp_char_multi1
   7DA8 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7DA9 03                    6 	.db 3 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7DAA 00                    7 	.db 0
   7DAB 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7DAC 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7DAE 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7DAF 00                   12 	.db e_ai_st_noAI
   7DB0 00                   13 	.db 0x00
   7DB1 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   7DB2 00                   15 	.db 0
   7DB3 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7DB5 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   017B                      79 level3_multi_ent2: DefineCmp_Entity 74, 150, 0, 0, 4, 16, _sp_char_multi2, e_ai_st_noAIMulti, 4, 0, 1, 1, 0
   7DB7 4A 96                 1 	.db 74, 150
   7DB9 00 00                 2 	.db 0, 0
   7DBB 04 10                 3 	.db 4, 16
   7DBD B4 74                 4 	.dw _sp_char_multi2
   7DBF 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7DC0 04                    6 	.db 4 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7DC1 00                    7 	.db 0
   7DC2 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7DC3 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7DC5 04                   11 	.db e_ai_st_noAIMulti 		;;AI - Status
   7DC6 04                   12 	.db e_ai_st_noAIMulti
   7DC7 00                   13 	.db 0x00
   7DC8 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   7DC9 00                   15 	.db 0
   7DCA 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7DCC CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0192                      80 level3_multi_ent3: DefineCmp_Entity 15, 0, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   7DCE 0F 00                 1 	.db 15, 0
   7DD0 00 00                 2 	.db 0, 0
   7DD2 02 1E                 3 	.db 2, 30
   7DD4 C8 71                 4 	.dw _sp_platV30
   7DD6 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7DD7 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7DD8 00                    7 	.db 0
   7DD9 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7DDA 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7DDC 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7DDD 00                   12 	.db e_ai_st_noAI
   7DDE 00                   13 	.db 0x00
   7DDF 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7DE0 00                   15 	.db 0
   7DE1 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7DE3 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   01A9                      81 level3_multi_ent4: DefineCmp_Entity 15, 30, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   7DE5 0F 1E                 1 	.db 15, 30
   7DE7 00 00                 2 	.db 0, 0
   7DE9 02 1E                 3 	.db 2, 30
   7DEB C8 71                 4 	.dw _sp_platV30
   7DED 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7DEE 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7DEF 00                    7 	.db 0
   7DF0 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7DF1 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7DF3 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7DF4 00                   12 	.db e_ai_st_noAI
   7DF5 00                   13 	.db 0x00
   7DF6 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7DF7 00                   15 	.db 0
   7DF8 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7DFA CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   01C0                      82 level3_multi_ent5: DefineCmp_Entity 15, 110, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   7DFC 0F 6E                 1 	.db 15, 110
   7DFE 00 00                 2 	.db 0, 0
   7E00 02 1E                 3 	.db 2, 30
   7E02 C8 71                 4 	.dw _sp_platV30
   7E04 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7E05 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7E06 00                    7 	.db 0
   7E07 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7E08 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7E0A 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7E0B 00                   12 	.db e_ai_st_noAI
   7E0C 00                   13 	.db 0x00
   7E0D 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7E0E 00                   15 	.db 0
   7E0F 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7E11 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   01D7                      83 level3_multi_ent6: DefineCmp_Entity 15, 140, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   7E13 0F 8C                 1 	.db 15, 140
   7E15 00 00                 2 	.db 0, 0
   7E17 02 1E                 3 	.db 2, 30
   7E19 C8 71                 4 	.dw _sp_platV30
   7E1B 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7E1C 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7E1D 00                    7 	.db 0
   7E1E 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7E1F 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7E21 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7E22 00                   12 	.db e_ai_st_noAI
   7E23 00                   13 	.db 0x00
   7E24 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7E25 00                   15 	.db 0
   7E26 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7E28 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   01EE                      84 level3_multi_ent7: DefineCmp_Entity 15, 170, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   7E2A 0F AA                 1 	.db 15, 170
   7E2C 00 00                 2 	.db 0, 0
   7E2E 02 1E                 3 	.db 2, 30
   7E30 C8 71                 4 	.dw _sp_platV30
   7E32 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7E33 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7E34 00                    7 	.db 0
   7E35 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7E36 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7E38 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7E39 00                   12 	.db e_ai_st_noAI
   7E3A 00                   13 	.db 0x00
   7E3B 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7E3C 00                   15 	.db 0
   7E3D 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7E3F CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                             85 
   0205                      86 level3_multi_ent8: DefineCmp_Entity 33, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   7E41 21 64                 1 	.db 33, 100
   7E43 00 00                 2 	.db 0, 0
   7E45 0F 08                 3 	.db 15, 8
   7E47 B4 73                 4 	.dw _sp_plat
   7E49 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7E4A 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7E4B 00                    7 	.db 0
   7E4C 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7E4D 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7E4F 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7E50 00                   12 	.db e_ai_st_noAI
   7E51 00                   13 	.db 0x00
   7E52 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7E53 00                   15 	.db 0
   7E54 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7E56 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                             87 
   021C                      88 level3_multi_ent9: DefineCmp_Entity 63, 0, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   7E58 3F 00                 1 	.db 63, 0
   7E5A 00 00                 2 	.db 0, 0
   7E5C 02 1E                 3 	.db 2, 30
   7E5E C8 71                 4 	.dw _sp_platV30
   7E60 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7E61 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7E62 00                    7 	.db 0
   7E63 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7E64 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7E66 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7E67 00                   12 	.db e_ai_st_noAI
   7E68 00                   13 	.db 0x00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   7E69 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7E6A 00                   15 	.db 0
   7E6B 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7E6D CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0233                      89 level3_multi_ent10: DefineCmp_Entity 63, 30, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   7E6F 3F 1E                 1 	.db 63, 30
   7E71 00 00                 2 	.db 0, 0
   7E73 02 1E                 3 	.db 2, 30
   7E75 C8 71                 4 	.dw _sp_platV30
   7E77 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7E78 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7E79 00                    7 	.db 0
   7E7A 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7E7B 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7E7D 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7E7E 00                   12 	.db e_ai_st_noAI
   7E7F 00                   13 	.db 0x00
   7E80 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7E81 00                   15 	.db 0
   7E82 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7E84 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   024A                      90 level3_multi_ent11: DefineCmp_Entity 63, 60, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   7E86 3F 3C                 1 	.db 63, 60
   7E88 00 00                 2 	.db 0, 0
   7E8A 02 1E                 3 	.db 2, 30
   7E8C C8 71                 4 	.dw _sp_platV30
   7E8E 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7E8F 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7E90 00                    7 	.db 0
   7E91 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7E92 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7E94 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7E95 00                   12 	.db e_ai_st_noAI
   7E96 00                   13 	.db 0x00
   7E97 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7E98 00                   15 	.db 0
   7E99 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7E9B CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0261                      91 level3_multi_ent12: DefineCmp_Entity 63, 90, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   7E9D 3F 5A                 1 	.db 63, 90
   7E9F 00 00                 2 	.db 0, 0
   7EA1 02 1E                 3 	.db 2, 30
   7EA3 C8 71                 4 	.dw _sp_platV30
   7EA5 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7EA6 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7EA7 00                    7 	.db 0
   7EA8 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7EA9 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7EAB 00                   11 	.db e_ai_st_noAI 		;;AI - Status
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   7EAC 00                   12 	.db e_ai_st_noAI
   7EAD 00                   13 	.db 0x00
   7EAE 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7EAF 00                   15 	.db 0
   7EB0 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7EB2 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0278                      92 level3_multi_ent13: DefineCmp_Entity 63, 120, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   7EB4 3F 78                 1 	.db 63, 120
   7EB6 00 00                 2 	.db 0, 0
   7EB8 02 1E                 3 	.db 2, 30
   7EBA C8 71                 4 	.dw _sp_platV30
   7EBC 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   7EBD 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   7EBE 00                    7 	.db 0
   7EBF 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   7EC0 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   7EC2 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   7EC3 00                   12 	.db e_ai_st_noAI
   7EC4 00                   13 	.db 0x00
   7EC5 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   7EC6 00                   15 	.db 0
   7EC7 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   7EC9 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                             93 ;;final
                             94 
   7ECB                      95 man_level3_multi_init::
                             96 
   7ECB 21 A0 7D      [10]   97 	ld hl, #level3_multi_ent1
   7ECE CD F7 8D      [17]   98 	call man_entity_create
   7ED1 CD 6A 7B      [17]   99 	call sys_eren_borrar	
   7ED4 21 B7 7D      [10]  100 	ld hl, #level3_multi_ent2
   7ED7 CD F7 8D      [17]  101 	call man_entity_create
   7EDA 21 CE 7D      [10]  102 	ld hl, #level3_multi_ent3
   7EDD CD F7 8D      [17]  103 	call man_entity_create
   7EE0 21 E5 7D      [10]  104 	ld hl, #level3_multi_ent4
   7EE3 CD F7 8D      [17]  105 	call man_entity_create
   7EE6 21 FC 7D      [10]  106 	ld hl, #level3_multi_ent5
   7EE9 CD F7 8D      [17]  107 	call man_entity_create
   7EEC 21 13 7E      [10]  108 	ld hl, #level3_multi_ent6
   7EEF CD F7 8D      [17]  109 	call man_entity_create
   7EF2 21 2A 7E      [10]  110 	ld hl, #level3_multi_ent7
   7EF5 CD F7 8D      [17]  111 	call man_entity_create
   7EF8 21 41 7E      [10]  112 	ld hl, #level3_multi_ent8
   7EFB CD F7 8D      [17]  113 	call man_entity_create
   7EFE 21 58 7E      [10]  114 	ld hl, #level3_multi_ent9
   7F01 CD F7 8D      [17]  115 	call man_entity_create
   7F04 21 6F 7E      [10]  116 	ld hl, #level3_multi_ent10
   7F07 CD F7 8D      [17]  117 	call man_entity_create
   7F0A 21 86 7E      [10]  118 	ld hl, #level3_multi_ent11
   7F0D CD F7 8D      [17]  119 	call man_entity_create
   7F10 21 9D 7E      [10]  120 	ld hl, #level3_multi_ent12
   7F13 CD F7 8D      [17]  121 	call man_entity_create
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



   7F16 21 B4 7E      [10]  122 	ld hl, #level3_multi_ent13
   7F19 CD F7 8D      [17]  123 	call man_entity_create
                            124 
   7F1C C9            [10]  125 	ret
                            126 
                            127 
                            128 
                            129 
