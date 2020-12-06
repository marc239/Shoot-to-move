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

;; Include all CPCtelera constant definitions, macros and variables
.include "cpctelera.h.s"
.include "main.h.s"
.include "man/man_game.h.s"
.include "man/man_one_levels.h.s"
.include "man/man_multi_levels.h.s"
.include "man/man_menu.h.s"
.include "man/man_multiplayer.h.s"
.include "man/man_escape.h.s"
.include "sys/sys_render.h.s"


.module main

.area _DATA
.area _CODE

_level: .db 0x01
_mode: .db 0x01 ;;1-> individual 2-> multiplayer


inc_level::
   ld a, (_level)
   inc a
   ld (_level),a
   ret
;;input a->level
set_level::
   ld (_level),a
   ret

set_multiplayer::

   ld a, #2
   ld (_mode), a

   ret

set_individual::

   ld a, #1
   ld (_mode), a

   ret
;;
;; MAIN function. This is the entry point of the application.
;;    _main:: global symbol is required for correctly compiling and linking
;;
_main::
   ;; Disable firmware to prevent it from interfering with string drawing
   call cpct_disableFirmware_asm
      pop af
      cpctm_setBorder_asm HW_WHITE
   ;;MUESTRA EL MENU PRINCIPAL
   call sys_eren_init
   call man_menu_inicial_init
   call cpct_akp_stop_asm



   ld a, #1
   ld (_level), a
   ld (_mode), a

loopMenu:
   call cpct_waitVSYNC_asm	
   call man_menu_inicial_update

   jr    loopMenu

startCreditos::
	pop af
	call man_menu_creditos_init
loopCreditos:
   ;;
   call cpct_waitVSYNC_asm	
   call man_menu_creditos_update
   call man_escape_update
   jr    loopCreditos

start_game::
	pop af
   ;; Inicializa el manager de juego
      ;;MUSICA PRUEBAS
   ld de, #_song_principal
   call cpct_akp_musicInit_asm


   call man_game_init

;;comprobamos si es multiplayer
   ld a, (_mode)
   cp #01
   jr nz, niveles_multiplayer 

   ld a, (_level)
   cp #01
   jr nz, _no_level1
   call man_level1_init
_no_level1:
   cp #02
   jr nz, _no_level2
   call man_level2_init
_no_level2:
   cp #03
   jr nz, _no_level3
   call man_level3_init
_no_level3:
   cp #04
   jr nz, _no_level4
   call man_level4_init
_no_level4:
   cp #05
   jr nz, _no_level5
   call man_level5_init
_no_level5:
   cp #06
   jr nz, _no_level6
   call man_level6_init
_no_level6:
   cp #07
   jr nz, _no_level7
   call man_level7_init
_no_level7:
   cp #08
   jr nz, _no_final
   jr _main
_no_final:
   jr loop

niveles_multiplayer:

   ld a, (_level)
   cp #01
   jr nz , no_level1
   call man_level1_multi_init
   jr loopmulti
no_level1:
   ld a, (_level)
   cp #02
   jr nz , no_level2
   call man_level2_multi_init
   jr loopmulti
no_level2:
   ld a, (_level)
   cp #03
   jr nz , no_level3
   call man_level3_multi_init
   jr loopmulti
no_level3:





;;Loop de juego
loop:

   call man_game_update
   call cpct_waitVSYNC_asm
   call man_game_render
   call cpct_akp_musicPlay_asm
   call man_escape_update
   jr    loop

loopmulti:

   call man_game_update_multi
   call cpct_waitVSYNC_asm
   call man_game_render
   call cpct_akp_musicPlay_asm
   call man_escape_update
   jr    loopmulti

menu_nivel_multi::
      call sys_eren_init
      call man_menu_nivel_init
loop_nivel_multi:

   call man_menu_nivel_update

   jr loop_nivel_multi

menu_restart::
   pop af

   ld a, b
   cp #1
   jr nz, no1
   call man_menu_restart_init_multi_1
   jr ya_init_restart
no1:
   cp #2
   jr nz, no2
   call man_menu_restart_init_multi_2
   jr ya_init_restart
no2:
   call man_menu_restart_init
ya_init_restart:

   call cpct_akp_stop_asm

loop_restart:

   call man_menu_restart_update
   call man_escape_update
   jr loop_restart