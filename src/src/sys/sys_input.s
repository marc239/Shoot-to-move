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

 ;; SISTEMA DE INPUT

.include "cpctelera.h.s"
.include "main.h.s"
.include "cmp/entity.h.s"
.include "sys/sys_physics.h.s"
.include "sys/sys_render.h.s"
.include "sys/sys_input.h.s"
.include "sys/sys_ai_control.h.s"
.include "man/man_entity.h.s"
.include "man/man_patrol.h.s"
.include "assets/assets.h.s"
.include "sys/sys_dash.h.s"
.include "sys/sys_jump.h.s"



_ya_eliminado:
	.db 0x00



sys_input_init::
	ret

_s_pulsada: .db 0x00
_a_pulsada: .db 0x00
_d_pulsada: .db 0x00


;;FUNCIONA 

;;INPUT:
;;	IX: puntero a la entidad [0] -> el personaje

sys_input_update::

	;ld e_vx(ix), #0
	;ld e_vy(ix), #0 ;;RESETEAMOS VELOCIDADES
	push ix
	call cpct_scanKeyboard_f_asm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PULSAR LA D
	ld hl, #Key_D
	call cpct_isKeyPressed_asm
	jr z, D_NotPressed
D_Pressed:
	ld a, (_d_pulsada)
	cp #0
	jr nz, D_ya_pulsada
	;;AQUI LO QUE HACEMOS AL PULSAR LA A
	ld e_vx(ix), #-4 ;;Ponemos velocidad

	ld d, e_x(ix)
	ld e, e_y(ix)
	ld c, #1
	ld b, #2
	call man_entity_crearBala
	;;AHORA CREAMOS UNA BALA
	
	
	ld a, #1
	ld (_d_pulsada), a
	jr ya_pulsado

D_NotPressed:
	ld a, #0
	ld (_d_pulsada), a

D_ya_pulsada:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;PULSAR LA A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ld hl, #Key_A
	call cpct_isKeyPressed_asm
	jr z, A_NotPressed
A_Pressed:
	ld a, (_a_pulsada)
	cp #0
	jr nz, A_ya_pulsada
	;;AQUI LO QUE HACEMOS AL PULSAR LA A
	ld e_vx(ix), #4 ;;Ponemos velocidad

	ld d, e_x(ix)
	ld e, e_y(ix)
	ld b, #1
	ld c, #1
	call man_entity_crearBala
	;;AHORA CREAMOS UNA BALA
	
	
	ld a, #1
	ld (_a_pulsada), a
	jr ya_pulsado

A_NotPressed:
	ld a, #0
	ld (_a_pulsada), a

A_ya_pulsada:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;	ld hl, #Key_W
;	call cpct_isKeyPressed_asm
;	jr z, W_NotPressed
;W_Pressed:
;	ld a, (_w_pulsada)
;	cp #0
;	jr nz, W_ya_pulsada
;	ld e_vy(ix), #4
;	ld a, #1
;	ld (_w_pulsada), a
;	jr W_ya_pulsada
;
;W_NotPressed:
;	ld a, #0
;	ld (_w_pulsada), a

;W_ya_pulsada:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;PULSAR LA S
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ld hl, #Key_S
	call cpct_isKeyPressed_asm
	jr z, S_NotPressed
S_Pressed:
	ld a, (_s_pulsada)
	cp #0
	jr nz, S_ya_pulsada
	;;AQUI LO QUE HACEMOS AL PULSAR LA S
	ld e_vy(ix), #-8 ;;Ponemos velocidad

	ld d, e_x(ix)
	ld e, e_y(ix)
	ld b, #3
	ld c, #1
	call man_entity_crearBala
	;;AHORA CREAMOS UNA BALA
	
	
	ld a, #1
	ld (_s_pulsada), a
	jr ya_pulsado

S_NotPressed:
	ld a, #0
	ld (_s_pulsada), a

S_ya_pulsada:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;TEMPORAL PARA PROBAR DELETE DE ENTIDADES
;	ld hl, #Key_J
;	call cpct_isKeyPressed_asm
;	jr z, J_NotPressed
;J_Pressed:
;	ld a, (_ya_eliminado)
;	cp #0
;	jr nz, J_NotPressed 
;	call man_entity_getArray
;	ld__d_ixh  ;;INTRUCCIONES NO DOCUMENTADAS
;	ld__e_ixl
;	ld h, d
;	ld l, e
;	call man_entity_delete
;	ld a, (_ya_eliminado)
;	inc a
;	ld (_ya_eliminado), a

;J_NotPressed:


	;;TEMPORAL PARA PROBAR IA

	;ld e_ai_aim_x(ix), #0

	;jr z, Spc_NotPressed

;Spc_Pressed:
	;ld e_ai_aim_x(ix), #1

	ld hl, #Key_Space
	call cpct_isKeyPressed_asm
	jr z, Spc_NotPressed
Spc_Pressed:
	ld e_ai_aim_x(ix), #1
;	call sys_jump_start

Spc_NotPressed:

;	call sys_jump_control

;;TEMPORAL PARA PROBAR STOP DE SALTO

;	ld hl, #Key_U
;	call cpct_isKeyPressed_asm
;	jr z, U_NotPressed
;U_Pressed:
	;call sys_jump_stop

;U_NotPressed:
ya_pulsado:

	pop ix
	call sys_dash_update
	;ld a, e_vx(ix)
	;sub #0

;;comprobamos restart
	;ld hl, #Key_F
	;call cpct_isKeyPressed_asm
	;jr z, F_restart_NotPressed

	;jp start_game

F_restart_NotPressed:
	ret