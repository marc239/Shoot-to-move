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

;;;;;;;;;;;;;
;;MANAGER DE MENUS
.include "cpctelera.h.s"
.include "main.h.s"
.include "man/man_game.h.s"
.include "sys/sys_render.h.s"
.include "assets/assets.h.s"



string_titulo:: .asciz "SHOOT TO MOVE"
string_start:: .asciz "CLASSIC"
string_multi:: .asciz "MULTIPLAYER"
string_arcade:: .asciz "ARCADE"
string_creditos:: .asciz "CREDITS"
string_cred_linea1:: .asciz "Game develop by"
string_cred_linea2:: .asciz "Marc Landes Molla"
string_restart_1:: .asciz "Player 1 wins"
string_restart_2:: .asciz "Player 2 wins"
string_restart_normal1:: .asciz "Press F to restart"
string_restart_normal2:: .asciz "Esc to go back"
string_elige_nivel:: .asciz "Press 1, 2 or 3"
string_elige_nivel2:: .asciz "to select level"

_opcion_seleccionada: .db 0x00
_direccion_antigua: .dw 0xC000

_up_pulsada: .db 0x00
_down_pulsada: .db 0x00

;;ESTO MUESTRA EL MENU PRINCIPAL
man_menu_inicial_init::

	ld c, #0
	call cpct_setVideoMode_asm ;;pone el modo de video a uno
	ld hl, #_main_pal
	ld de, #16
	call cpct_setPalette_asm

	ld    h, #0         ;; C= Background PEN ()
	ld    l, #15         ;; B = Foreground PEN ()

	call cpct_setDrawCharM0_asm

	ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   	ld    b, #24                  ;; B = y coordinate (24 = 0x18)
	ld    c, #13                  ;; C = x coordinate (16 = 0x10)

	call cpct_getScreenPtr_asm	

	ld   iy, #string_titulo    ;; IY = Pointer to the string 

	call cpct_drawStringM0_asm

	;;DIBUJAR START
	ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   	ld    b, #70                  ;; B = y coordinate (24 = 0x18)
	ld    c, #15                  ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_start    ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm

	ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   	ld    b, #90                  ;; B = y coordinate (24 = 0x18)
	ld    c, #15                  ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_multi    ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm

	ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   	ld    b, #110                  ;; B = y coordinate (24 = 0x18)
	ld    c, #15                  ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_creditos    ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm

	;ld   de, #CPCT_VMEM_START_ASM ;; DE = Pointer to start of the screen
   	;ld    b, #130                  ;; B = y coordinate (24 = 0x18)
	;ld    c, #15                  ;; C = x coordinate (16 = 0x10)
	;call cpct_getScreenPtr_asm	
	;ld   iy, #string_creditos    ;; IY = Pointer to the string 
	;call cpct_drawStringM0_asm

	ret

man_menu_inicial_update::

	;;OPCION 0-> start
	;;OPCION 1-> creditos
	;;primero borramos el antiguo
	;;PRIMERO COMPROBAMOS EL INPUT
	call cpct_scanKeyboard_f_asm

	ld hl, #Key_CursorUp
	call cpct_isKeyPressed_asm
	jr z, Up_NotPressed
Up_Pressed:
	;;SI PULSA LA D RESTAMOS Comprobamos si es 0
	ld a, (_up_pulsada)
	cp #0
	jr nz, Up_alreadyPressed

	ld a, (_opcion_seleccionada) 
	cp #0
	jr z, Up_NotPressed ;;Si es cero no hacemos nada
	;;si no es cero le restamos uno
	dec a
	ld (_opcion_seleccionada), a

	ld a, #1
	ld (_up_pulsada), a
	jr Up_alreadyPressed
Up_NotPressed:
	ld a, #0
	ld (_up_pulsada), a
Up_alreadyPressed:

	ld hl, #Key_CursorDown
	call cpct_isKeyPressed_asm
	jr z, Down_NotPressed
Down_Pressed:
	ld a, (_down_pulsada)
	cp #0
	jr nz, Down_alreadyPressed
	;;SI PULSA LA D RESTAMOS Comprobamos si es 0
	ld a, (_opcion_seleccionada) 
	sub #2
	jr z, Down_NotPressed ;;Si es cero no hacemos nada
	;;si no es cero le restamos uno
	inc a
	inc a
	inc a
	inc a
	ld (_opcion_seleccionada), a

	ld a, #1
	ld (_down_pulsada), a
	jr Down_alreadyPressed
Down_NotPressed:
	ld a, #0
	ld (_down_pulsada), a
Down_alreadyPressed:


	call man_menu_principal_renderSelected


	;;AHORA COMPROBAMOS SI PULSA ENTER
	ld hl, #Key_F
	call cpct_isKeyPressed_asm
	jr z, Enter_NotPressed
Enter_Pressed:
	ld a, (_opcion_seleccionada)
	cp #2
	jr nz, no_creditos
	jp startCreditos
no_creditos:
	cp #0
	jr nz, no_normal
	;;AQUI CUANDO EMPIEZA NORMAL
	call set_individual
	jp start_game
no_normal:
	cp #1
	jr nz, Enter_NotPressed
	call set_multiplayer
	jp menu_nivel_multi
Enter_NotPressed:
	ret



man_menu_principal_renderSelected:

	;;comprobamos cual es la opcion seleccionada

	ld de, (_direccion_antigua)
	ld a, #0x00
	ld c, #2
	ld b, #4
	call cpct_drawSolidBox_asm

	ld a, (_opcion_seleccionada)

	ld de, #0xC000
	ld c, #10 ;;x 
	;;AHORA CARGAMOS EN B EN BASE A LA OPCION ELEGIDA
	;;PRIMERO COMPROBAMOS SI ES 0 0 1 2 3 
	ld b, #70
	cp #0
	jr z, _acabado
	;;ahora vamos restando
	ld b, #90
	sub #1
	jr z, _acabado
	ld b, #110
	sub #1
	jr z, _acabado
	ld b, #130
_acabado:
    	call cpct_getScreenPtr_asm

    	ld (_direccion_antigua), hl

	ex de, hl
	ld a, #0xFF
	ld c, #2
	ld b, #4
	call cpct_drawSolidBox_asm

	ret


man_menu_creditos_init::

	;;PRIMERO LIMPIAMOS LA PANTALLA
	ld de, #0xC000
	ld a, #0x00
	ld c, #64 ;;ANCHURA
	ld b, #200
	call cpct_drawSolidBox_asm


	ld   de, #0xC000 ;; DE = Pointer to start of the screen
   	ld    b, #24                  ;; B = y coordinate (24 = 0x18)
	ld    c, #13                  ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_titulo    ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm

	ld   de, #0xC000 ;; DE = Pointer to start of the screen
   	ld    b, #90                  ;; B = y coordinate (24 = 0x18)
	ld    c, #10                 ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_cred_linea1    ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm


	ld   de, #0xC000 ;; DE = Pointer to start of the screen
   	ld    b, #120                  ;; B = y coordinate (24 = 0x18)
	ld    c, #7                  ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_cred_linea2    ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm

	ret

man_menu_creditos_update::

	ret


man_menu_restart_init::

	call sys_eren_init



	ld   de, #0xC000 ;; DE = Pointer to start of the screen
   	ld    b, #40                  ;; B = y coordinate (24 = 0x18)
	ld    c, #3                  ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_restart_normal1   ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm


	ld   de, #0xC000 ;; DE = Pointer to start of the screen
   	ld    b, #80                  ;; B = y coordinate (24 = 0x18)
	ld    c, #7                  ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_restart_normal2   ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm



	ret

man_menu_restart_init_multi_1::

	call sys_eren_init

	ld   de, #0xC000 ;; DE = Pointer to start of the screen
   	ld    b, #80                  ;; B = y coordinate (24 = 0x18)
	ld    c, #3                  ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_restart_normal1   ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm


	ld   de, #0xC000 ;; DE = Pointer to start of the screen
   	ld    b, #100                  ;; B = y coordinate (24 = 0x18)
	ld    c, #7                  ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_restart_normal2   ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm

	ld    h, #0         ;; C= Background PEN ()
	ld    l, #5         ;; B = Foreground PEN ()

	call cpct_setDrawCharM0_asm


	ld   de, #0xC000 ;; DE = Pointer to start of the screen
   	ld    b, #40                  ;; B = y coordinate (24 = 0x18)
	ld    c, #9                  ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_restart_2   ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm

	ld    h, #0         ;; C= Background PEN ()
	ld    l, #15         ;; B = Foreground PEN ()

	call cpct_setDrawCharM0_asm


	ret

man_menu_restart_init_multi_2::

	call sys_eren_init

	ld   de, #0xC000 ;; DE = Pointer to start of the screen
   	ld    b, #80                  ;; B = y coordinate (24 = 0x18)
	ld    c, #3                  ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_restart_normal1   ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm


	ld   de, #0xC000 ;; DE = Pointer to start of the screen
   	ld    b, #100                  ;; B = y coordinate (24 = 0x18)
	ld    c, #7                  ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_restart_normal2   ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm

	ld    h, #0         ;; C= Background PEN ()
	ld    l, #14         ;; B = Foreground PEN ()
	call cpct_setDrawCharM0_asm

	ld   de, #0xC000 ;; DE = Pointer to start of the screen
   	ld    b, #40                  ;; B = y coordinate (24 = 0x18)
	ld    c, #9                  ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_restart_1   ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm

	ld    h, #0         ;; C= Background PEN ()
	ld    l, #15         ;; B = Foreground PEN ()

	call cpct_setDrawCharM0_asm

	ret



man_menu_restart_update::

	call cpct_scanKeyboard_f_asm


	ld hl, #Key_F
	call cpct_isKeyPressed_asm
	jr z, F_restart_NotPressed

	jp start_game


F_restart_NotPressed::


	ret

man_menu_nivel_update::

	call cpct_scanKeyboard_f_asm
   ld hl, #Key_1
   call cpct_isKeyPressed_asm
   jr z, one_NotPressed
   ld a, #1
   call set_level
   jp start_game
one_NotPressed:
   ld hl, #Key_2
   call cpct_isKeyPressed_asm
   jr z, two_NotPressed
   ld a, #2
   call set_level
   jp start_game
two_NotPressed:
   ld hl, #Key_3
   call cpct_isKeyPressed_asm
   jr z, three_NotPressed
   ld a, #3
   call set_level
   jp start_game
three_NotPressed:


	ret
	
man_menu_nivel_init::


	ld   de, #0xC000 ;; DE = Pointer to start of the screen
   	ld    b, #80                  ;; B = y coordinate (24 = 0x18)
	ld    c, #3                  ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_restart_normal1   ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm


	ld   de, #0xC000 ;; DE = Pointer to start of the screen
   	ld    b, #100                  ;; B = y coordinate (24 = 0x18)
	ld    c, #7                  ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_restart_normal2   ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm

	ld   de, #0xC000 ;; DE = Pointer to start of the screen
   	ld    b, #40                  ;; B = y coordinate (24 = 0x18)
	ld    c, #9                  ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_elige_nivel   ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm


	ld   de, #0xC000 ;; DE = Pointer to start of the screen
   	ld    b, #60                  ;; B = y coordinate (24 = 0x18)
	ld    c, #9                  ;; C = x coordinate (16 = 0x10)
	call cpct_getScreenPtr_asm	
	ld   iy, #string_elige_nivel2   ;; IY = Pointer to the string 
	call cpct_drawStringM0_asm


	call cpct_setDrawCharM0_asm

	ret