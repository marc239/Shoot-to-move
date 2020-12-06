;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module char_multi_2
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sp_char_multi2
	.globl _main_pal32
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
_main_pal32:
	.db #0x54	; 84	'T'
	.db #0x44	; 68	'D'
	.db #0x5c	; 92
	.db #0x58	; 88	'X'
	.db #0x45	; 69	'E'
	.db #0x52	; 82	'R'
	.db #0x46	; 70	'F'
	.db #0x5e	; 94
	.db #0x40	; 64
	.db #0x47	; 71	'G'
	.db #0x42	; 66	'B'
	.db #0x53	; 83	'S'
	.db #0x5a	; 90	'Z'
	.db #0x4a	; 74	'J'
	.db #0x43	; 67	'C'
	.db #0x4b	; 75	'K'
_sp_char_multi2:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
