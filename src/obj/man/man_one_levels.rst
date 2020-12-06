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
                             23 
                             24 ;;AQUI SE ENCUENTREAN TODOS LOS NIVELES INDIVIDUALES
                             25 
                             26 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             27 ;;LEVEL 1
                             28 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   0000                      29 level1_ent1: DefineCmp_Entity 0, 150, 0, 0, 4, 16, _sp_mainchar, e_ai_st_noAI, 3, 0, 1, 1, 0
   800A 00 96                 1 	.db 0, 150
   800C 00 00                 2 	.db 0, 0
   800E 04 10                 3 	.db 4, 16
   8010 54 75                 4 	.dw _sp_mainchar
   8012 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8013 03                    6 	.db 3 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8014 00                    7 	.db 0
   8015 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8016 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8018 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8019 00                   12 	.db e_ai_st_noAI
   801A 00                   13 	.db 0x00
   801B 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   801C 00                   15 	.db 0
   801D 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   801F CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0017                      30 level1_ent2: DefineCmp_Entity 25, 170, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   8021 19 AA                 1 	.db 25, 170
   8023 00 00                 2 	.db 0, 0
   8025 02 1E                 3 	.db 2, 30
   8027 C8 71                 4 	.dw _sp_platV30
   8029 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   802A 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   802B 00                    7 	.db 0
   802C 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   802D 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   802F 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8030 00                   12 	.db e_ai_st_noAI
   8031 00                   13 	.db 0x00
   8032 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8033 00                   15 	.db 0
   8034 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8036 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   002E                      31 level1_ent3: DefineCmp_Entity 50, 170, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   8038 32 AA                 1 	.db 50, 170
   803A 00 00                 2 	.db 0, 0
   803C 02 1E                 3 	.db 2, 30
   803E C8 71                 4 	.dw _sp_platV30
   8040 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8041 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8042 00                    7 	.db 0
   8043 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   8044 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8046 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8047 00                   12 	.db e_ai_st_noAI
   8048 00                   13 	.db 0x00
   8049 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   804A 00                   15 	.db 0
   804B 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   804D CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                             32 
                             33 
                             34 ;;final
   0045                      35 level1_ent5: DefineCmp_Entity 70, 175, 0, 0, 4, 16, _sp_final, e_ai_st_noAI, 1, 0, 0, 0, 1
   804F 46 AF                 1 	.db 70, 175
   8051 00 00                 2 	.db 0, 0
   8053 04 10                 3 	.db 4, 16
   8055 78 71                 4 	.dw _sp_final
   8057 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8058 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8059 00                    7 	.db 0
   805A 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   805B 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   805D 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   805E 00                   12 	.db e_ai_st_noAI
   805F 00                   13 	.db 0x00
   8060 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8061 01                   15 	.db 1
   8062 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8064 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                             36 
   8066                      37 man_level1_init::
                             38 
   8066 21 0A 80      [10]   39 	ld hl, #level1_ent1
   8069 CD F7 8D      [17]   40 	call man_entity_create
   806C CD 6A 7B      [17]   41 	call sys_eren_borrar	
   806F 21 21 80      [10]   42 	ld hl, #level1_ent2
   8072 CD F7 8D      [17]   43 	call man_entity_create
   8075 21 38 80      [10]   44 	ld hl, #level1_ent3
   8078 CD F7 8D      [17]   45 	call man_entity_create
                             46 	;ld hl, #jaj
                             47 	;call man_entity_create
                             48 	;ld hl, #level1_ent6
                             49 	;call man_entity_create
   807B 21 4F 80      [10]   50 	ld hl, #level1_ent5
   807E CD F7 8D      [17]   51 	call man_entity_create
                             52 	;ld hl, #ent3
                             53 	;call man_entity_create
                             54 	;ld hl, #ent4
                             55 	;call man_entity_create
                             56 
   8081 C9            [10]   57 	ret
                             58 
   0078                      59 level2_ent1: DefineCmp_Entity 64, 150, 0, 0, 4, 16, _sp_mainchar, e_ai_st_noAI, 3, 0, 1, 1, 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   8082 40 96                 1 	.db 64, 150
   8084 00 00                 2 	.db 0, 0
   8086 04 10                 3 	.db 4, 16
   8088 54 75                 4 	.dw _sp_mainchar
   808A 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   808B 03                    6 	.db 3 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   808C 00                    7 	.db 0
   808D 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   808E 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8090 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8091 00                   12 	.db e_ai_st_noAI
   8092 00                   13 	.db 0x00
   8093 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   8094 00                   15 	.db 0
   8095 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8097 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   008F                      60 level2_ent2: DefineCmp_Entity 60, 162, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   8099 3C A2                 1 	.db 60, 162
   809B 00 00                 2 	.db 0, 0
   809D 02 1E                 3 	.db 2, 30
   809F C8 71                 4 	.dw _sp_platV30
   80A1 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   80A2 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   80A3 00                    7 	.db 0
   80A4 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   80A5 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   80A7 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   80A8 00                   12 	.db e_ai_st_noAI
   80A9 00                   13 	.db 0x00
   80AA 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   80AB 00                   15 	.db 0
   80AC 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   80AE CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   00A6                      61 level2_ent3: DefineCmp_Entity 60, 192, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   80B0 3C C0                 1 	.db 60, 192
   80B2 00 00                 2 	.db 0, 0
   80B4 0F 08                 3 	.db 15, 8
   80B6 B4 73                 4 	.dw _sp_plat
   80B8 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   80B9 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   80BA 00                    7 	.db 0
   80BB 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   80BC 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   80BE 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   80BF 00                   12 	.db e_ai_st_noAI
   80C0 00                   13 	.db 0x00
   80C1 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   80C2 00                   15 	.db 0
   80C3 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   80C5 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   00BD                      62 level2_ent4: DefineCmp_Entity 60, 132, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   80C7 3C 84                 1 	.db 60, 132
   80C9 00 00                 2 	.db 0, 0
   80CB 02 1E                 3 	.db 2, 30
   80CD C8 71                 4 	.dw _sp_platV30
   80CF 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   80D0 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   80D1 00                    7 	.db 0
   80D2 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   80D3 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   80D5 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   80D6 00                   12 	.db e_ai_st_noAI
   80D7 00                   13 	.db 0x00
   80D8 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   80D9 00                   15 	.db 0
   80DA 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   80DC CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   00D4                      63 level2_ent5: DefineCmp_Entity 60, 102, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   80DE 3C 66                 1 	.db 60, 102
   80E0 00 00                 2 	.db 0, 0
   80E2 02 1E                 3 	.db 2, 30
   80E4 C8 71                 4 	.dw _sp_platV30
   80E6 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   80E7 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   80E8 00                    7 	.db 0
   80E9 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   80EA 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   80EC 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   80ED 00                   12 	.db e_ai_st_noAI
   80EE 00                   13 	.db 0x00
   80EF 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   80F0 00                   15 	.db 0
   80F1 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   80F3 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   00EB                      64 level2_ent6: DefineCmp_Entity 45, 102, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   80F5 2D 66                 1 	.db 45, 102
   80F7 00 00                 2 	.db 0, 0
   80F9 0F 08                 3 	.db 15, 8
   80FB B4 73                 4 	.dw _sp_plat
   80FD 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   80FE 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   80FF 00                    7 	.db 0
   8100 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8101 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8103 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8104 00                   12 	.db e_ai_st_noAI
   8105 00                   13 	.db 0x00
   8106 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8107 00                   15 	.db 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   8108 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   810A CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0102                      65 level2_ent7: DefineCmp_Entity 15, 102, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   810C 0F 66                 1 	.db 15, 102
   810E 00 00                 2 	.db 0, 0
   8110 0F 08                 3 	.db 15, 8
   8112 B4 73                 4 	.dw _sp_plat
   8114 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8115 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8116 00                    7 	.db 0
   8117 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8118 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   811A 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   811B 00                   12 	.db e_ai_st_noAI
   811C 00                   13 	.db 0x00
   811D 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   811E 00                   15 	.db 0
   811F 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8121 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0119                      66 level2_ent8: DefineCmp_Entity 20, 192, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   8123 14 C0                 1 	.db 20, 192
   8125 00 00                 2 	.db 0, 0
   8127 0F 08                 3 	.db 15, 8
   8129 B4 73                 4 	.dw _sp_plat
   812B 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   812C 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   812D 00                    7 	.db 0
   812E 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   812F 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8131 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8132 00                   12 	.db e_ai_st_noAI
   8133 00                   13 	.db 0x00
   8134 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8135 00                   15 	.db 0
   8136 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8138 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0130                      67 level2_ent9: DefineCmp_Entity 0, 102, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   813A 00 66                 1 	.db 0, 102
   813C 00 00                 2 	.db 0, 0
   813E 0F 08                 3 	.db 15, 8
   8140 B4 73                 4 	.dw _sp_plat
   8142 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8143 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8144 00                    7 	.db 0
   8145 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8146 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8148 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8149 00                   12 	.db e_ai_st_noAI
   814A 00                   13 	.db 0x00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   814B 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   814C 00                   15 	.db 0
   814D 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   814F CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0147                      68 level2_ent10: DefineCmp_Entity 4, 192, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 2, 1, 0
   8151 04 C0                 1 	.db 4, 192
   8153 00 00                 2 	.db 0, 0
   8155 0F 08                 3 	.db 15, 8
   8157 F0 70                 4 	.dw _sp_rojo
   8159 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   815A 02                    6 	.db 2 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   815B 01                    7 	.db 1
   815C 02                    8 	.db 2 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   815D 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   815F 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8160 00                   12 	.db e_ai_st_noAI
   8161 00                   13 	.db 0x00
   8162 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   8163 00                   15 	.db 0
   8164 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8166 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   015E                      69 level2_ent11: DefineCmp_Entity 36, 192, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 2, 1, 0
   8168 24 C0                 1 	.db 36, 192
   816A 00 00                 2 	.db 0, 0
   816C 0F 08                 3 	.db 15, 8
   816E F0 70                 4 	.dw _sp_rojo
   8170 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8171 02                    6 	.db 2 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8172 01                    7 	.db 1
   8173 02                    8 	.db 2 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8174 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8176 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8177 00                   12 	.db e_ai_st_noAI
   8178 00                   13 	.db 0x00
   8179 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   817A 00                   15 	.db 0
   817B 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   817D CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                             70 
                             71 ;;final
   0175                      72 level2_ent12: DefineCmp_Entity 15, 130, 0, 0, 4, 16, _sp_final, e_ai_st_noAI, 1, 0, 0, 0, 1
   817F 0F 82                 1 	.db 15, 130
   8181 00 00                 2 	.db 0, 0
   8183 04 10                 3 	.db 4, 16
   8185 78 71                 4 	.dw _sp_final
   8187 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8188 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8189 00                    7 	.db 0
   818A 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   818B 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   818D 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   818E 00                   12 	.db e_ai_st_noAI
   818F 00                   13 	.db 0x00
   8190 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8191 01                   15 	.db 1
   8192 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8194 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                             73 
                             74 
   8196                      75 man_level2_init::
                             76 
   8196 21 82 80      [10]   77 	ld hl, #level2_ent1
   8199 CD F7 8D      [17]   78 	call man_entity_create
   819C CD 6A 7B      [17]   79 	call sys_eren_borrar	
   819F 21 99 80      [10]   80 	ld hl, #level2_ent2
   81A2 CD F7 8D      [17]   81 	call man_entity_create
                             82 	;ld hl, #ent3
                             83 	;call man_entity_create
   81A5 21 B0 80      [10]   84 	ld hl, #level2_ent3
   81A8 CD F7 8D      [17]   85 	call man_entity_create
   81AB 21 C7 80      [10]   86 	ld hl, #level2_ent4
   81AE CD F7 8D      [17]   87 	call man_entity_create
   81B1 21 DE 80      [10]   88 	ld hl, #level2_ent5
   81B4 CD F7 8D      [17]   89 	call man_entity_create
   81B7 21 F5 80      [10]   90 	ld hl, #level2_ent6
   81BA CD F7 8D      [17]   91 	call man_entity_create
   81BD 21 0C 81      [10]   92 	ld hl, #level2_ent7
   81C0 CD F7 8D      [17]   93 	call man_entity_create
   81C3 21 23 81      [10]   94 	ld hl, #level2_ent8
   81C6 CD F7 8D      [17]   95 	call man_entity_create
   81C9 21 3A 81      [10]   96 	ld hl, #level2_ent9
   81CC CD F7 8D      [17]   97 	call man_entity_create
   81CF 21 51 81      [10]   98 	ld hl, #level2_ent10
   81D2 CD F7 8D      [17]   99 	call man_entity_create
   81D5 21 68 81      [10]  100 	ld hl, #level2_ent11
   81D8 CD F7 8D      [17]  101 	call man_entity_create
   81DB 21 7F 81      [10]  102 	ld hl, #level2_ent12
   81DE CD F7 8D      [17]  103 	call man_entity_create
                            104 
   81E1 C9            [10]  105 	ret
                            106 
                            107 
   01D8                     108 level3_ent1: DefineCmp_Entity 5, 0, 0, 0, 4, 16, _sp_mainchar, e_ai_st_noAI, 3, 0, 1, 1, 0
   81E2 05 00                 1 	.db 5, 0
   81E4 00 00                 2 	.db 0, 0
   81E6 04 10                 3 	.db 4, 16
   81E8 54 75                 4 	.dw _sp_mainchar
   81EA 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   81EB 03                    6 	.db 3 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   81EC 00                    7 	.db 0
   81ED 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   81EE 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   81F0 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   81F1 00                   12 	.db e_ai_st_noAI
   81F2 00                   13 	.db 0x00
   81F3 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   81F4 00                   15 	.db 0
   81F5 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   81F7 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   01EF                     109 level3_ent2: DefineCmp_Entity 60, 30, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   81F9 3C 1E                 1 	.db 60, 30
   81FB 00 00                 2 	.db 0, 0
   81FD 02 1E                 3 	.db 2, 30
   81FF C8 71                 4 	.dw _sp_platV30
   8201 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8202 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8203 00                    7 	.db 0
   8204 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8205 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8207 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8208 00                   12 	.db e_ai_st_noAI
   8209 00                   13 	.db 0x00
   820A 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   820B 00                   15 	.db 0
   820C 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   820E CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0206                     110 level3_ent3: DefineCmp_Entity 0, 30, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   8210 00 1E                 1 	.db 0, 30
   8212 00 00                 2 	.db 0, 0
   8214 0F 08                 3 	.db 15, 8
   8216 B4 73                 4 	.dw _sp_plat
   8218 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8219 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   821A 00                    7 	.db 0
   821B 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   821C 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   821E 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   821F 00                   12 	.db e_ai_st_noAI
   8220 00                   13 	.db 0x00
   8221 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8222 00                   15 	.db 0
   8223 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8225 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   021D                     111 level3_ent4: DefineCmp_Entity 60, 60, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   8227 3C 3C                 1 	.db 60, 60
   8229 00 00                 2 	.db 0, 0
   822B 02 1E                 3 	.db 2, 30
   822D C8 71                 4 	.dw _sp_platV30
   822F 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8230 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8231 00                    7 	.db 0
   8232 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8233 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8235 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8236 00                   12 	.db e_ai_st_noAI
   8237 00                   13 	.db 0x00
   8238 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8239 00                   15 	.db 0
   823A 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   823C CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0234                     112 level3_ent5: DefineCmp_Entity 60, 90, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   823E 3C 5A                 1 	.db 60, 90
   8240 00 00                 2 	.db 0, 0
   8242 02 1E                 3 	.db 2, 30
   8244 C8 71                 4 	.dw _sp_platV30
   8246 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8247 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8248 00                    7 	.db 0
   8249 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   824A 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   824C 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   824D 00                   12 	.db e_ai_st_noAI
   824E 00                   13 	.db 0x00
   824F 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8250 00                   15 	.db 0
   8251 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8253 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   024B                     113 level3_ent6: DefineCmp_Entity 45, 112, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   8255 2D 70                 1 	.db 45, 112
   8257 00 00                 2 	.db 0, 0
   8259 0F 08                 3 	.db 15, 8
   825B B4 73                 4 	.dw _sp_plat
   825D 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   825E 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   825F 00                    7 	.db 0
   8260 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8261 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8263 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8264 00                   12 	.db e_ai_st_noAI
   8265 00                   13 	.db 0x00
   8266 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8267 00                   15 	.db 0
   8268 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   826A CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0262                     114 level3_ent7: DefineCmp_Entity 60, 0, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   826C 3C 00                 1 	.db 60, 0
   826E 00 00                 2 	.db 0, 0
   8270 02 1E                 3 	.db 2, 30
   8272 C8 71                 4 	.dw _sp_platV30
   8274 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8275 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   8276 00                    7 	.db 0
   8277 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8278 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   827A 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   827B 00                   12 	.db e_ai_st_noAI
   827C 00                   13 	.db 0x00
   827D 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   827E 00                   15 	.db 0
   827F 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8281 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0279                     115 level3_ent8: DefineCmp_Entity 30, 112, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   8283 1E 70                 1 	.db 30, 112
   8285 00 00                 2 	.db 0, 0
   8287 0F 08                 3 	.db 15, 8
   8289 B4 73                 4 	.dw _sp_plat
   828B 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   828C 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   828D 00                    7 	.db 0
   828E 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   828F 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8291 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8292 00                   12 	.db e_ai_st_noAI
   8293 00                   13 	.db 0x00
   8294 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8295 00                   15 	.db 0
   8296 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8298 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0290                     116 level3_ent9: DefineCmp_Entity 5, 192, 0, 0, 60, 8, _sp_rojo_grande,  e_ai_st_noAI, 2, 1, 1, 1, 0
   829A 05 C0                 1 	.db 5, 192
   829C 00 00                 2 	.db 0, 0
   829E 3C 08                 3 	.db 60, 8
   82A0 00 6F                 4 	.dw _sp_rojo_grande
   82A2 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   82A3 02                    6 	.db 2 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   82A4 01                    7 	.db 1
   82A5 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   82A6 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   82A8 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   82A9 00                   12 	.db e_ai_st_noAI
   82AA 00                   13 	.db 0x00
   82AB 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   82AC 00                   15 	.db 0
   82AD 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   82AF CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                            117 ;level3_ent10: DefineCmp_Entity 15, 192, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 0, 0
                            118 ;level3_ent11: DefineCmp_Entity 30, 192, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 0, 0
                            119 ;level3_ent12: DefineCmp_Entity 45, 192, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 0, 0
                            120 ;level3_ent13: DefineCmp_Entity 60, 192, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 0, 0
                            121 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



                            122 ;;final
   02A7                     123 level3_ent14: DefineCmp_Entity 64, 40, 0, 0, 4, 16, _sp_final, e_ai_st_noAI, 1, 0, 0, 0, 1
   82B1 40 28                 1 	.db 64, 40
   82B3 00 00                 2 	.db 0, 0
   82B5 04 10                 3 	.db 4, 16
   82B7 78 71                 4 	.dw _sp_final
   82B9 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   82BA 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   82BB 00                    7 	.db 0
   82BC 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   82BD 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   82BF 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   82C0 00                   12 	.db e_ai_st_noAI
   82C1 00                   13 	.db 0x00
   82C2 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   82C3 01                   15 	.db 1
   82C4 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   82C6 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                            124 
                            125 
   82C8                     126 man_level3_init::
                            127 
   82C8 21 E2 81      [10]  128 	ld hl, #level3_ent1
   82CB CD F7 8D      [17]  129 	call man_entity_create
   82CE CD 6A 7B      [17]  130 	call sys_eren_borrar	
   82D1 21 F9 81      [10]  131 	ld hl, #level3_ent2
   82D4 CD F7 8D      [17]  132 	call man_entity_create
   82D7 21 10 82      [10]  133 	ld hl, #level3_ent3
   82DA CD F7 8D      [17]  134 	call man_entity_create
   82DD 21 27 82      [10]  135 	ld hl, #level3_ent4
   82E0 CD F7 8D      [17]  136 	call man_entity_create
   82E3 21 3E 82      [10]  137 	ld hl, #level3_ent5
   82E6 CD F7 8D      [17]  138 	call man_entity_create
   82E9 21 55 82      [10]  139 	ld hl, #level3_ent6
   82EC CD F7 8D      [17]  140 	call man_entity_create
   82EF 21 6C 82      [10]  141 	ld hl, #level3_ent7
   82F2 CD F7 8D      [17]  142 	call man_entity_create
   82F5 21 83 82      [10]  143 	ld hl, #level3_ent8
   82F8 CD F7 8D      [17]  144 	call man_entity_create
   82FB 21 9A 82      [10]  145 	ld hl, #level3_ent9
   82FE CD F7 8D      [17]  146 	call man_entity_create
   8301 21 B1 82      [10]  147 	ld hl, #level3_ent14
   8304 CD F7 8D      [17]  148 	call man_entity_create
   8307 C9            [10]  149 	ret
                            150 
                            151 
   02FE                     152 level4_ent1: DefineCmp_Entity 60, 50, 0, 0, 4, 16, _sp_mainchar, e_ai_st_noAI, 3, 0, 1, 1, 0
   8308 3C 32                 1 	.db 60, 50
   830A 00 00                 2 	.db 0, 0
   830C 04 10                 3 	.db 4, 16
   830E 54 75                 4 	.dw _sp_mainchar
   8310 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8311 03                    6 	.db 3 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   8312 00                    7 	.db 0
   8313 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8314 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8316 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8317 00                   12 	.db e_ai_st_noAI
   8318 00                   13 	.db 0x00
   8319 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   831A 00                   15 	.db 0
   831B 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   831D CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0315                     153 level4_ent2: DefineCmp_Entity 50, 70, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   831F 32 46                 1 	.db 50, 70
   8321 00 00                 2 	.db 0, 0
   8323 02 1E                 3 	.db 2, 30
   8325 C8 71                 4 	.dw _sp_platV30
   8327 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8328 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8329 00                    7 	.db 0
   832A 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   832B 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   832D 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   832E 00                   12 	.db e_ai_st_noAI
   832F 00                   13 	.db 0x00
   8330 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8331 00                   15 	.db 0
   8332 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8334 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   032C                     154 level4_ent3: DefineCmp_Entity 34, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   8336 22 64                 1 	.db 34, 100
   8338 00 00                 2 	.db 0, 0
   833A 0F 08                 3 	.db 15, 8
   833C B4 73                 4 	.dw _sp_plat
   833E 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   833F 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8340 00                    7 	.db 0
   8341 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8342 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8344 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8345 00                   12 	.db e_ai_st_noAI
   8346 00                   13 	.db 0x00
   8347 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8348 00                   15 	.db 0
   8349 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   834B CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0343                     155 level4_ent4: DefineCmp_Entity 49, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   834D 31 64                 1 	.db 49, 100
   834F 00 00                 2 	.db 0, 0
   8351 0F 08                 3 	.db 15, 8
   8353 B4 73                 4 	.dw _sp_plat
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



   8355 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8356 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8357 00                    7 	.db 0
   8358 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8359 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   835B 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   835C 00                   12 	.db e_ai_st_noAI
   835D 00                   13 	.db 0x00
   835E 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   835F 00                   15 	.db 0
   8360 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8362 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   035A                     156 level4_ent5: DefineCmp_Entity 64, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   8364 40 64                 1 	.db 64, 100
   8366 00 00                 2 	.db 0, 0
   8368 0F 08                 3 	.db 15, 8
   836A B4 73                 4 	.dw _sp_plat
   836C 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   836D 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   836E 00                    7 	.db 0
   836F 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8370 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8372 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8373 00                   12 	.db e_ai_st_noAI
   8374 00                   13 	.db 0x00
   8375 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8376 00                   15 	.db 0
   8377 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8379 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0371                     157 level4_ent6: DefineCmp_Entity 30, 70, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   837B 1E 46                 1 	.db 30, 70
   837D 00 00                 2 	.db 0, 0
   837F 02 1E                 3 	.db 2, 30
   8381 C8 71                 4 	.dw _sp_platV30
   8383 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8384 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8385 00                    7 	.db 0
   8386 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8387 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8389 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   838A 00                   12 	.db e_ai_st_noAI
   838B 00                   13 	.db 0x00
   838C 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   838D 00                   15 	.db 0
   838E 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8390 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0388                     158 level4_ent7: DefineCmp_Entity 19, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   8392 13 64                 1 	.db 19, 100
   8394 00 00                 2 	.db 0, 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 21.
Hexadecimal [16-Bits]



   8396 0F 08                 3 	.db 15, 8
   8398 B4 73                 4 	.dw _sp_plat
   839A 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   839B 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   839C 00                    7 	.db 0
   839D 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   839E 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   83A0 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   83A1 00                   12 	.db e_ai_st_noAI
   83A2 00                   13 	.db 0x00
   83A3 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   83A4 00                   15 	.db 0
   83A5 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   83A7 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   039F                     159 level4_ent8: DefineCmp_Entity 5, 192, 0, 0, 60, 8, _sp_rojo_grande,  e_ai_st_noAI, 2, 1, 1, 1, 0
   83A9 05 C0                 1 	.db 5, 192
   83AB 00 00                 2 	.db 0, 0
   83AD 3C 08                 3 	.db 60, 8
   83AF 00 6F                 4 	.dw _sp_rojo_grande
   83B1 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   83B2 02                    6 	.db 2 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   83B3 01                    7 	.db 1
   83B4 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   83B5 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   83B7 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   83B8 00                   12 	.db e_ai_st_noAI
   83B9 00                   13 	.db 0x00
   83BA 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   83BB 00                   15 	.db 0
   83BC 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   83BE CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   03B6                     160 level4_ent9: DefineCmp_Entity 33,90, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 1, 0
   83C0 21 5A                 1 	.db 33, 90
   83C2 00 00                 2 	.db 0, 0
   83C4 0F 08                 3 	.db 15, 8
   83C6 F0 70                 4 	.dw _sp_rojo
   83C8 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   83C9 02                    6 	.db 2 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   83CA 01                    7 	.db 1
   83CB 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   83CC 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   83CE 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   83CF 00                   12 	.db e_ai_st_noAI
   83D0 00                   13 	.db 0x00
   83D1 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   83D2 00                   15 	.db 0
   83D3 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   83D5 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                            161 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 22.
Hexadecimal [16-Bits]



                            162 ;;final
   03CD                     163 level4_ent10: DefineCmp_Entity 64, 120, 0, 0, 4, 16, _sp_final, e_ai_st_noAI, 1, 0, 0, 0, 1
   83D7 40 78                 1 	.db 64, 120
   83D9 00 00                 2 	.db 0, 0
   83DB 04 10                 3 	.db 4, 16
   83DD 78 71                 4 	.dw _sp_final
   83DF 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   83E0 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   83E1 00                    7 	.db 0
   83E2 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   83E3 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   83E5 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   83E6 00                   12 	.db e_ai_st_noAI
   83E7 00                   13 	.db 0x00
   83E8 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   83E9 01                   15 	.db 1
   83EA 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   83EC CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                            164 
                            165 
   83EE                     166 man_level4_init::
                            167 
   83EE 21 08 83      [10]  168 	ld hl, #level4_ent1
   83F1 CD F7 8D      [17]  169 	call man_entity_create
   83F4 CD 6A 7B      [17]  170 	call sys_eren_borrar	
   83F7 21 1F 83      [10]  171 	ld hl, #level4_ent2
   83FA CD F7 8D      [17]  172 	call man_entity_create
   83FD 21 36 83      [10]  173 	ld hl, #level4_ent3
   8400 CD F7 8D      [17]  174 	call man_entity_create
   8403 21 4D 83      [10]  175 	ld hl, #level4_ent4
   8406 CD F7 8D      [17]  176 	call man_entity_create
   8409 21 64 83      [10]  177 	ld hl, #level4_ent5
   840C CD F7 8D      [17]  178 	call man_entity_create
   840F 21 7B 83      [10]  179 	ld hl, #level4_ent6
   8412 CD F7 8D      [17]  180 	call man_entity_create
   8415 21 92 83      [10]  181 	ld hl, #level4_ent7
   8418 CD F7 8D      [17]  182 	call man_entity_create
   841B 21 A9 83      [10]  183 	ld hl, #level4_ent8
   841E CD F7 8D      [17]  184 	call man_entity_create
   8421 21 C0 83      [10]  185 	ld hl, #level4_ent9
   8424 CD F7 8D      [17]  186 	call man_entity_create
   8427 21 D7 83      [10]  187 	ld hl, #level4_ent10
   842A CD F7 8D      [17]  188 	call man_entity_create
                            189 
   842D C9            [10]  190 	ret
                            191 
                            192 
                            193 
   0424                     194 level5_ent1: DefineCmp_Entity 0, 50, 0, 0, 4, 16, _sp_mainchar, e_ai_st_noAI, 3, 0, 1, 1, 0
   842E 00 32                 1 	.db 0, 50
   8430 00 00                 2 	.db 0, 0
   8432 04 10                 3 	.db 4, 16
   8434 54 75                 4 	.dw _sp_mainchar
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 23.
Hexadecimal [16-Bits]



   8436 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8437 03                    6 	.db 3 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8438 00                    7 	.db 0
   8439 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   843A 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   843C 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   843D 00                   12 	.db e_ai_st_noAI
   843E 00                   13 	.db 0x00
   843F 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   8440 00                   15 	.db 0
   8441 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8443 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   043B                     195 level5_ent2: DefineCmp_Entity 15, 0, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   8445 0F 00                 1 	.db 15, 0
   8447 00 00                 2 	.db 0, 0
   8449 02 1E                 3 	.db 2, 30
   844B C8 71                 4 	.dw _sp_platV30
   844D 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   844E 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   844F 00                    7 	.db 0
   8450 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8451 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8453 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8454 00                   12 	.db e_ai_st_noAI
   8455 00                   13 	.db 0x00
   8456 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8457 00                   15 	.db 0
   8458 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   845A CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0452                     196 level5_ent3: DefineCmp_Entity 0, 122, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   845C 00 7A                 1 	.db 0, 122
   845E 00 00                 2 	.db 0, 0
   8460 0F 08                 3 	.db 15, 8
   8462 B4 73                 4 	.dw _sp_plat
   8464 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8465 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8466 00                    7 	.db 0
   8467 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8468 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   846A 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   846B 00                   12 	.db e_ai_st_noAI
   846C 00                   13 	.db 0x00
   846D 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   846E 00                   15 	.db 0
   846F 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8471 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0469                     197 level5_ent4: DefineCmp_Entity 15, 70, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   8473 0F 46                 1 	.db 15, 70
   8475 00 00                 2 	.db 0, 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 24.
Hexadecimal [16-Bits]



   8477 02 1E                 3 	.db 2, 30
   8479 C8 71                 4 	.dw _sp_platV30
   847B 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   847C 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   847D 00                    7 	.db 0
   847E 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   847F 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8481 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8482 00                   12 	.db e_ai_st_noAI
   8483 00                   13 	.db 0x00
   8484 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8485 00                   15 	.db 0
   8486 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8488 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0480                     198 level5_ent5: DefineCmp_Entity 15, 100, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   848A 0F 64                 1 	.db 15, 100
   848C 00 00                 2 	.db 0, 0
   848E 02 1E                 3 	.db 2, 30
   8490 C8 71                 4 	.dw _sp_platV30
   8492 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8493 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8494 00                    7 	.db 0
   8495 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8496 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8498 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8499 00                   12 	.db e_ai_st_noAI
   849A 00                   13 	.db 0x00
   849B 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   849C 00                   15 	.db 0
   849D 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   849F CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0497                     199 level5_ent6: DefineCmp_Entity 18, 130, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 1, 0
   84A1 12 82                 1 	.db 18, 130
   84A3 00 00                 2 	.db 0, 0
   84A5 0F 08                 3 	.db 15, 8
   84A7 F0 70                 4 	.dw _sp_rojo
   84A9 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   84AA 02                    6 	.db 2 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   84AB 01                    7 	.db 1
   84AC 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   84AD 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   84AF 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   84B0 00                   12 	.db e_ai_st_noAI
   84B1 00                   13 	.db 0x00
   84B2 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   84B3 00                   15 	.db 0
   84B4 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   84B6 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   04AE                     200 level5_ent7: DefineCmp_Entity 50, 0, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 25.
Hexadecimal [16-Bits]



   84B8 32 00                 1 	.db 50, 0
   84BA 00 00                 2 	.db 0, 0
   84BC 02 1E                 3 	.db 2, 30
   84BE C8 71                 4 	.dw _sp_platV30
   84C0 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   84C1 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   84C2 00                    7 	.db 0
   84C3 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   84C4 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   84C6 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   84C7 00                   12 	.db e_ai_st_noAI
   84C8 00                   13 	.db 0x00
   84C9 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   84CA 00                   15 	.db 0
   84CB 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   84CD CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   04C5                     201 level5_ent8: DefineCmp_Entity 50, 30, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   84CF 32 1E                 1 	.db 50, 30
   84D1 00 00                 2 	.db 0, 0
   84D3 02 1E                 3 	.db 2, 30
   84D5 C8 71                 4 	.dw _sp_platV30
   84D7 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   84D8 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   84D9 00                    7 	.db 0
   84DA 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   84DB 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   84DD 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   84DE 00                   12 	.db e_ai_st_noAI
   84DF 00                   13 	.db 0x00
   84E0 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   84E1 00                   15 	.db 0
   84E2 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   84E4 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   04DC                     202 level5_ent9: DefineCmp_Entity 50, 110, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   84E6 32 6E                 1 	.db 50, 110
   84E8 00 00                 2 	.db 0, 0
   84EA 02 1E                 3 	.db 2, 30
   84EC C8 71                 4 	.dw _sp_platV30
   84EE 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   84EF 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   84F0 00                    7 	.db 0
   84F1 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   84F2 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   84F4 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   84F5 00                   12 	.db e_ai_st_noAI
   84F6 00                   13 	.db 0x00
   84F7 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   84F8 00                   15 	.db 0
   84F9 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   84FB CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 26.
Hexadecimal [16-Bits]



                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   04F3                     203 level5_ent10: DefineCmp_Entity 34,130, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 1, 0
   84FD 22 82                 1 	.db 34, 130
   84FF 00 00                 2 	.db 0, 0
   8501 0F 08                 3 	.db 15, 8
   8503 F0 70                 4 	.dw _sp_rojo
   8505 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8506 02                    6 	.db 2 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8507 01                    7 	.db 1
   8508 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8509 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   850B 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   850C 00                   12 	.db e_ai_st_noAI
   850D 00                   13 	.db 0x00
   850E 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   850F 00                   15 	.db 0
   8510 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8512 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                            204 
                            205 ;;final
   050A                     206 level5_ent11: DefineCmp_Entity 64, 120, 0, 0, 4, 16, _sp_final, e_ai_st_noAI, 1, 0, 0, 0, 1
   8514 40 78                 1 	.db 64, 120
   8516 00 00                 2 	.db 0, 0
   8518 04 10                 3 	.db 4, 16
   851A 78 71                 4 	.dw _sp_final
   851C 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   851D 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   851E 00                    7 	.db 0
   851F 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8520 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8522 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8523 00                   12 	.db e_ai_st_noAI
   8524 00                   13 	.db 0x00
   8525 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8526 01                   15 	.db 1
   8527 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8529 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                            207 
                            208 
   852B                     209 man_level5_init::
                            210 
   852B 21 2E 84      [10]  211 	ld hl, #level5_ent1
   852E CD F7 8D      [17]  212 	call man_entity_create
   8531 CD 6A 7B      [17]  213 	call sys_eren_borrar	
   8534 21 45 84      [10]  214 	ld hl, #level5_ent2
   8537 CD F7 8D      [17]  215 	call man_entity_create
   853A 21 5C 84      [10]  216 	ld hl, #level5_ent3
   853D CD F7 8D      [17]  217 	call man_entity_create
   8540 21 73 84      [10]  218 	ld hl, #level5_ent4
   8543 CD F7 8D      [17]  219 	call man_entity_create
   8546 21 8A 84      [10]  220 	ld hl, #level5_ent5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 27.
Hexadecimal [16-Bits]



   8549 CD F7 8D      [17]  221 	call man_entity_create
   854C 21 A1 84      [10]  222 	ld hl, #level5_ent6
   854F CD F7 8D      [17]  223 	call man_entity_create
   8552 21 B8 84      [10]  224 	ld hl, #level5_ent7
   8555 CD F7 8D      [17]  225 	call man_entity_create
   8558 21 CF 84      [10]  226 	ld hl, #level5_ent8
   855B CD F7 8D      [17]  227 	call man_entity_create
   855E 21 E6 84      [10]  228 	ld hl, #level5_ent9
   8561 CD F7 8D      [17]  229 	call man_entity_create
   8564 21 FD 84      [10]  230 	ld hl, #level5_ent10
   8567 CD F7 8D      [17]  231 	call man_entity_create
   856A 21 14 85      [10]  232 	ld hl, #level5_ent11
   856D CD F7 8D      [17]  233 	call man_entity_create
                            234 
   8570 C9            [10]  235 	ret
                            236 
   0567                     237 level6_ent1: DefineCmp_Entity 64, 50, 0, 0, 4, 16, _sp_mainchar, e_ai_st_noAI, 3, 0, 1, 1, 0
   8571 40 32                 1 	.db 64, 50
   8573 00 00                 2 	.db 0, 0
   8575 04 10                 3 	.db 4, 16
   8577 54 75                 4 	.dw _sp_mainchar
   8579 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   857A 03                    6 	.db 3 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   857B 00                    7 	.db 0
   857C 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   857D 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   857F 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8580 00                   12 	.db e_ai_st_noAI
   8581 00                   13 	.db 0x00
   8582 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   8583 00                   15 	.db 0
   8584 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8586 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   057E                     238 level6_ent2: DefineCmp_Entity 20, 70, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   8588 14 46                 1 	.db 20, 70
   858A 00 00                 2 	.db 0, 0
   858C 02 1E                 3 	.db 2, 30
   858E C8 71                 4 	.dw _sp_platV30
   8590 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8591 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8592 00                    7 	.db 0
   8593 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8594 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8596 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8597 00                   12 	.db e_ai_st_noAI
   8598 00                   13 	.db 0x00
   8599 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   859A 00                   15 	.db 0
   859B 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   859D CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0595                     239 level6_ent3: DefineCmp_Entity 20, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 28.
Hexadecimal [16-Bits]



   859F 14 64                 1 	.db 20, 100
   85A1 00 00                 2 	.db 0, 0
   85A3 0F 08                 3 	.db 15, 8
   85A5 B4 73                 4 	.dw _sp_plat
   85A7 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   85A8 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   85A9 00                    7 	.db 0
   85AA 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   85AB 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   85AD 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   85AE 00                   12 	.db e_ai_st_noAI
   85AF 00                   13 	.db 0x00
   85B0 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   85B1 00                   15 	.db 0
   85B2 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   85B4 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   05AC                     240 level6_ent4: DefineCmp_Entity 35, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   85B6 23 64                 1 	.db 35, 100
   85B8 00 00                 2 	.db 0, 0
   85BA 0F 08                 3 	.db 15, 8
   85BC B4 73                 4 	.dw _sp_plat
   85BE 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   85BF 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   85C0 00                    7 	.db 0
   85C1 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   85C2 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   85C4 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   85C5 00                   12 	.db e_ai_st_noAI
   85C6 00                   13 	.db 0x00
   85C7 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   85C8 00                   15 	.db 0
   85C9 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   85CB CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   05C3                     241 level6_ent5: DefineCmp_Entity 50, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   85CD 32 64                 1 	.db 50, 100
   85CF 00 00                 2 	.db 0, 0
   85D1 0F 08                 3 	.db 15, 8
   85D3 B4 73                 4 	.dw _sp_plat
   85D5 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   85D6 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   85D7 00                    7 	.db 0
   85D8 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   85D9 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   85DB 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   85DC 00                   12 	.db e_ai_st_noAI
   85DD 00                   13 	.db 0x00
   85DE 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   85DF 00                   15 	.db 0
   85E0 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   85E2 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 29.
Hexadecimal [16-Bits]



                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   05DA                     242 level6_ent6: DefineCmp_Entity 65, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   85E4 41 64                 1 	.db 65, 100
   85E6 00 00                 2 	.db 0, 0
   85E8 0F 08                 3 	.db 15, 8
   85EA B4 73                 4 	.dw _sp_plat
   85EC 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   85ED 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   85EE 00                    7 	.db 0
   85EF 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   85F0 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   85F2 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   85F3 00                   12 	.db e_ai_st_noAI
   85F4 00                   13 	.db 0x00
   85F5 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   85F6 00                   15 	.db 0
   85F7 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   85F9 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   05F1                     243 level6_ent7: DefineCmp_Entity 5, 192, 0, 0, 60, 8, _sp_rojo_grande,  e_ai_st_noAI, 2, 1, 1, 1, 0
   85FB 05 C0                 1 	.db 5, 192
   85FD 00 00                 2 	.db 0, 0
   85FF 3C 08                 3 	.db 60, 8
   8601 00 6F                 4 	.dw _sp_rojo_grande
   8603 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8604 02                    6 	.db 2 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8605 01                    7 	.db 1
   8606 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8607 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8609 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   860A 00                   12 	.db e_ai_st_noAI
   860B 00                   13 	.db 0x00
   860C 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   860D 00                   15 	.db 0
   860E 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8610 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                            244 ;level6_ent8: DefineCmp_Entity 5, 0, 0, 0, 60, 8, _sp_rojo_grande,  e_ai_st_noAI, 2, 1, 1, 1, 0
   0608                     245 level6_ent9: DefineCmp_Entity 50, 70, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   8612 32 46                 1 	.db 50, 70
   8614 00 00                 2 	.db 0, 0
   8616 02 1E                 3 	.db 2, 30
   8618 C8 71                 4 	.dw _sp_platV30
   861A 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   861B 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   861C 00                    7 	.db 0
   861D 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   861E 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8620 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8621 00                   12 	.db e_ai_st_noAI
   8622 00                   13 	.db 0x00
   8623 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 30.
Hexadecimal [16-Bits]



   8624 00                   15 	.db 0
   8625 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8627 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   061F                     246 level6_ent10: DefineCmp_Entity 50, 108, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   8629 32 6C                 1 	.db 50, 108
   862B 00 00                 2 	.db 0, 0
   862D 02 1E                 3 	.db 2, 30
   862F C8 71                 4 	.dw _sp_platV30
   8631 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8632 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8633 00                    7 	.db 0
   8634 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8635 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8637 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8638 00                   12 	.db e_ai_st_noAI
   8639 00                   13 	.db 0x00
   863A 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   863B 00                   15 	.db 0
   863C 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   863E CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0636                     247 level6_ent11: DefineCmp_Entity 20, 108, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   8640 14 6C                 1 	.db 20, 108
   8642 00 00                 2 	.db 0, 0
   8644 02 1E                 3 	.db 2, 30
   8646 C8 71                 4 	.dw _sp_platV30
   8648 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8649 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   864A 00                    7 	.db 0
   864B 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   864C 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   864E 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   864F 00                   12 	.db e_ai_st_noAI
   8650 00                   13 	.db 0x00
   8651 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8652 00                   15 	.db 0
   8653 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8655 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                            248 
                            249 ;level6_ent4: DefineCmp_Entity 18, 130, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 1, 0
                            250 ;;final
   064D                     251 level6_ent12: DefineCmp_Entity 64, 120, 0, 0, 4, 16, _sp_final, e_ai_st_noAI, 1, 0, 0, 0, 1
   8657 40 78                 1 	.db 64, 120
   8659 00 00                 2 	.db 0, 0
   865B 04 10                 3 	.db 4, 16
   865D 78 71                 4 	.dw _sp_final
   865F 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8660 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8661 00                    7 	.db 0
   8662 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 31.
Hexadecimal [16-Bits]



   8663 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8665 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8666 00                   12 	.db e_ai_st_noAI
   8667 00                   13 	.db 0x00
   8668 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8669 01                   15 	.db 1
   866A 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   866C CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                            252 
                            253 
   866E                     254 man_level6_init::
                            255 
   866E 21 71 85      [10]  256 	ld hl, #level6_ent1
   8671 CD F7 8D      [17]  257 	call man_entity_create
   8674 CD 6A 7B      [17]  258 	call sys_eren_borrar	
   8677 21 88 85      [10]  259 	ld hl, #level6_ent2
   867A CD F7 8D      [17]  260 	call man_entity_create
   867D 21 9F 85      [10]  261 	ld hl, #level6_ent3
   8680 CD F7 8D      [17]  262 	call man_entity_create
   8683 21 B6 85      [10]  263 	ld hl, #level6_ent4
   8686 CD F7 8D      [17]  264 	call man_entity_create
   8689 21 CD 85      [10]  265 	ld hl, #level6_ent5
   868C CD F7 8D      [17]  266 	call man_entity_create
   868F 21 E4 85      [10]  267 	ld hl, #level6_ent6
   8692 CD F7 8D      [17]  268 	call man_entity_create
   8695 21 FB 85      [10]  269 	ld hl, #level6_ent7
   8698 CD F7 8D      [17]  270 	call man_entity_create
                            271 	;ld hl, #level6_ent8
                            272 	;call man_entity_create
   869B 21 12 86      [10]  273 	ld hl, #level6_ent9
   869E CD F7 8D      [17]  274 	call man_entity_create
   86A1 21 29 86      [10]  275 	ld hl, #level6_ent10
   86A4 CD F7 8D      [17]  276 	call man_entity_create
   86A7 21 40 86      [10]  277 	ld hl, #level6_ent11
   86AA CD F7 8D      [17]  278 	call man_entity_create
   86AD 21 57 86      [10]  279 	ld hl, #level6_ent12
   86B0 CD F7 8D      [17]  280 	call man_entity_create
                            281 
   86B3 C9            [10]  282 	ret
                            283 
   06AA                     284 level7_ent1: DefineCmp_Entity 0, 0, 0, 0, 4, 16, _sp_mainchar, e_ai_st_noAI, 3, 0, 1, 1, 0
   86B4 00 00                 1 	.db 0, 0
   86B6 00 00                 2 	.db 0, 0
   86B8 04 10                 3 	.db 4, 16
   86BA 54 75                 4 	.dw _sp_mainchar
   86BC 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   86BD 03                    6 	.db 3 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   86BE 00                    7 	.db 0
   86BF 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   86C0 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   86C2 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   86C3 00                   12 	.db e_ai_st_noAI
   86C4 00                   13 	.db 0x00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 32.
Hexadecimal [16-Bits]



   86C5 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   86C6 00                   15 	.db 0
   86C7 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   86C9 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   06C1                     285 level7_ent2: DefineCmp_Entity 15, 0, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   86CB 0F 00                 1 	.db 15, 0
   86CD 00 00                 2 	.db 0, 0
   86CF 02 1E                 3 	.db 2, 30
   86D1 C8 71                 4 	.dw _sp_platV30
   86D3 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   86D4 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   86D5 00                    7 	.db 0
   86D6 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   86D7 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   86D9 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   86DA 00                   12 	.db e_ai_st_noAI
   86DB 00                   13 	.db 0x00
   86DC 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   86DD 00                   15 	.db 0
   86DE 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   86E0 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   06D8                     286 level7_ent3: DefineCmp_Entity 15, 30, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   86E2 0F 1E                 1 	.db 15, 30
   86E4 00 00                 2 	.db 0, 0
   86E6 02 1E                 3 	.db 2, 30
   86E8 C8 71                 4 	.dw _sp_platV30
   86EA 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   86EB 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   86EC 00                    7 	.db 0
   86ED 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   86EE 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   86F0 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   86F1 00                   12 	.db e_ai_st_noAI
   86F2 00                   13 	.db 0x00
   86F3 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   86F4 00                   15 	.db 0
   86F5 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   86F7 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   06EF                     287 level7_ent4: DefineCmp_Entity 15, 60, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   86F9 0F 3C                 1 	.db 15, 60
   86FB 00 00                 2 	.db 0, 0
   86FD 02 1E                 3 	.db 2, 30
   86FF C8 71                 4 	.dw _sp_platV30
   8701 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8702 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8703 00                    7 	.db 0
   8704 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8705 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8707 00                   11 	.db e_ai_st_noAI 		;;AI - Status
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 33.
Hexadecimal [16-Bits]



   8708 00                   12 	.db e_ai_st_noAI
   8709 00                   13 	.db 0x00
   870A 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   870B 00                   15 	.db 0
   870C 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   870E CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0706                     288 level7_ent5: DefineCmp_Entity 25, 150, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   8710 19 96                 1 	.db 25, 150
   8712 00 00                 2 	.db 0, 0
   8714 0F 08                 3 	.db 15, 8
   8716 B4 73                 4 	.dw _sp_plat
   8718 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8719 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   871A 00                    7 	.db 0
   871B 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   871C 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   871E 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   871F 00                   12 	.db e_ai_st_noAI
   8720 00                   13 	.db 0x00
   8721 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8722 00                   15 	.db 0
   8723 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8725 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   071D                     289 level7_ent6: DefineCmp_Entity 16, 192, 0, 0, 60, 8, _sp_rojo_grande,  e_ai_st_noAI, 2, 1, 1, 1, 0
   8727 10 C0                 1 	.db 16, 192
   8729 00 00                 2 	.db 0, 0
   872B 3C 08                 3 	.db 60, 8
   872D 00 6F                 4 	.dw _sp_rojo_grande
   872F 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8730 02                    6 	.db 2 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8731 01                    7 	.db 1
   8732 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8733 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8735 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8736 00                   12 	.db e_ai_st_noAI
   8737 00                   13 	.db 0x00
   8738 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   8739 00                   15 	.db 0
   873A 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   873C CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0734                     290 level7_ent7: DefineCmp_Entity 0, 192, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 1, 0
   873E 00 C0                 1 	.db 0, 192
   8740 00 00                 2 	.db 0, 0
   8742 0F 08                 3 	.db 15, 8
   8744 F0 70                 4 	.dw _sp_rojo
   8746 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8747 02                    6 	.db 2 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8748 01                    7 	.db 1
   8749 01                    8 	.db 1 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 34.
Hexadecimal [16-Bits]



   874A 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   874C 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   874D 00                   12 	.db e_ai_st_noAI
   874E 00                   13 	.db 0x00
   874F 01                   14 	.db 1 ;;0->  es mapa 1-> NO es mapa 
   8750 00                   15 	.db 0
   8751 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8753 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   074B                     291 level7_ent8: DefineCmp_Entity 63, 30, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   8755 3F 1E                 1 	.db 63, 30
   8757 00 00                 2 	.db 0, 0
   8759 02 1E                 3 	.db 2, 30
   875B C8 71                 4 	.dw _sp_platV30
   875D 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   875E 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   875F 00                    7 	.db 0
   8760 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8761 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8763 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8764 00                   12 	.db e_ai_st_noAI
   8765 00                   13 	.db 0x00
   8766 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8767 00                   15 	.db 0
   8768 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   876A CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0762                     292 level7_ent9: DefineCmp_Entity 63, 60, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   876C 3F 3C                 1 	.db 63, 60
   876E 00 00                 2 	.db 0, 0
   8770 02 1E                 3 	.db 2, 30
   8772 C8 71                 4 	.dw _sp_platV30
   8774 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   8775 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   8776 00                    7 	.db 0
   8777 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   8778 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   877A 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   877B 00                   12 	.db e_ai_st_noAI
   877C 00                   13 	.db 0x00
   877D 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   877E 00                   15 	.db 0
   877F 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8781 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0779                     293 level7_ent10: DefineCmp_Entity 63, 90, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
   8783 3F 5A                 1 	.db 63, 90
   8785 00 00                 2 	.db 0, 0
   8787 02 1E                 3 	.db 2, 30
   8789 C8 71                 4 	.dw _sp_platV30
   878B 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   878C 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   878D 00                    7 	.db 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 35.
Hexadecimal [16-Bits]



   878E 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   878F 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   8791 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   8792 00                   12 	.db e_ai_st_noAI
   8793 00                   13 	.db 0x00
   8794 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   8795 00                   15 	.db 0
   8796 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   8798 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
   0790                     294 level7_ent11: DefineCmp_Entity 63, 22, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
   879A 3F 16                 1 	.db 63, 22
   879C 00 00                 2 	.db 0, 0
   879E 0F 08                 3 	.db 15, 8
   87A0 B4 73                 4 	.dw _sp_plat
   87A2 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   87A3 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   87A4 00                    7 	.db 0
   87A5 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   87A6 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   87A8 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   87A9 00                   12 	.db e_ai_st_noAI
   87AA 00                   13 	.db 0x00
   87AB 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   87AC 00                   15 	.db 0
   87AD 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   87AF CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                            295 
                            296 ;;final
   07A7                     297 level7_ent12: DefineCmp_Entity 65, 50, 0, 0, 4, 16, _sp_final, e_ai_st_noAI, 1, 0, 0, 0, 1
   87B1 41 32                 1 	.db 65, 50
   87B3 00 00                 2 	.db 0, 0
   87B5 04 10                 3 	.db 4, 16
   87B7 78 71                 4 	.dw _sp_final
   87B9 00                    5 	.db 0x00 ;;COMPRUEBA SI ES LA PRIMERA VEZ QUE SE DIBUJA
   87BA 01                    6 	.db 1 ;;COLISION 0 -> no colisiona 1-> si colisiona 2-> bala/enemigo
   87BB 00                    7 	.db 0
   87BC 00                    8 	.db 0 ;;entidades con salud = 0-> entidades que no sufren dmg
                              9 	;;en el caso de las entidades que hacen dmg, health es el dmg que causan
   87BD 00 00                10 	.db 0x00, 0x00 ;;AI-aim x,y(hacia donde va)
   87BF 00                   11 	.db e_ai_st_noAI 		;;AI - Status
   87C0 00                   12 	.db e_ai_st_noAI
   87C1 00                   13 	.db 0x00
   87C2 00                   14 	.db 0 ;;0->  es mapa 1-> NO es mapa 
   87C3 01                   15 	.db 1
   87C4 00 00                16 	.dw 0x0000			;; AI puntero a patrulla step
   87C6 CC CC                17 	.dw 0xCCCC;;puntero a la ultima posicion de la memoria de video
                             18 			;;sirve para borrar mas deprisa (asi se calcula solo una vez)
                            298 
                            299 
   87C8                     300 man_level7_init::
                            301 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 36.
Hexadecimal [16-Bits]



   87C8 21 B4 86      [10]  302 	ld hl, #level7_ent1
   87CB CD F7 8D      [17]  303 	call man_entity_create
   87CE CD 6A 7B      [17]  304 	call sys_eren_borrar	
   87D1 21 CB 86      [10]  305 	ld hl, #level7_ent2
   87D4 CD F7 8D      [17]  306 	call man_entity_create
   87D7 21 E2 86      [10]  307 	ld hl, #level7_ent3
   87DA CD F7 8D      [17]  308 	call man_entity_create
   87DD 21 F9 86      [10]  309 	ld hl, #level7_ent4
   87E0 CD F7 8D      [17]  310 	call man_entity_create
   87E3 21 10 87      [10]  311 	ld hl, #level7_ent5
   87E6 CD F7 8D      [17]  312 	call man_entity_create
   87E9 21 27 87      [10]  313 	ld hl, #level7_ent6
   87EC CD F7 8D      [17]  314 	call man_entity_create
   87EF 21 3E 87      [10]  315 	ld hl, #level7_ent7
   87F2 CD F7 8D      [17]  316 	call man_entity_create
   87F5 21 55 87      [10]  317 	ld hl, #level7_ent8
   87F8 CD F7 8D      [17]  318 	call man_entity_create
   87FB 21 6C 87      [10]  319 	ld hl, #level7_ent9
   87FE CD F7 8D      [17]  320 	call man_entity_create
   8801 21 83 87      [10]  321 	ld hl, #level7_ent10
   8804 CD F7 8D      [17]  322 	call man_entity_create
   8807 21 9A 87      [10]  323 	ld hl, #level7_ent11
   880A CD F7 8D      [17]  324 	call man_entity_create
   880D 21 B1 87      [10]  325 	ld hl, #level7_ent12
   8810 CD F7 8D      [17]  326 	call man_entity_create
                            327 	
   8813 C9            [10]  328 	ret
