                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module platVertical30
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _sp_platV30
                             12 	.globl _main_pal1
                             13 ;--------------------------------------------------------
                             14 ; special function registers
                             15 ;--------------------------------------------------------
                             16 ;--------------------------------------------------------
                             17 ; ram data
                             18 ;--------------------------------------------------------
                             19 	.area _DATA
                             20 ;--------------------------------------------------------
                             21 ; ram data
                             22 ;--------------------------------------------------------
                             23 	.area _INITIALIZED
                             24 ;--------------------------------------------------------
                             25 ; absolute external ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DABS (ABS)
                             28 ;--------------------------------------------------------
                             29 ; global & static initialisations
                             30 ;--------------------------------------------------------
                             31 	.area _HOME
                             32 	.area _GSINIT
                             33 	.area _GSFINAL
                             34 	.area _GSINIT
                             35 ;--------------------------------------------------------
                             36 ; Home
                             37 ;--------------------------------------------------------
                             38 	.area _HOME
                             39 	.area _HOME
                             40 ;--------------------------------------------------------
                             41 ; code
                             42 ;--------------------------------------------------------
                             43 	.area _CODE
                             44 	.area _CODE
   71B8                      45 _main_pal1:
   71B8 54                   46 	.db #0x54	; 84	'T'
   71B9 44                   47 	.db #0x44	; 68	'D'
   71BA 5C                   48 	.db #0x5c	; 92
   71BB 58                   49 	.db #0x58	; 88	'X'
   71BC 45                   50 	.db #0x45	; 69	'E'
   71BD 52                   51 	.db #0x52	; 82	'R'
   71BE 46                   52 	.db #0x46	; 70	'F'
   71BF 5E                   53 	.db #0x5e	; 94
   71C0 40                   54 	.db #0x40	; 64
   71C1 47                   55 	.db #0x47	; 71	'G'
   71C2 42                   56 	.db #0x42	; 66	'B'
   71C3 53                   57 	.db #0x53	; 83	'S'
   71C4 5A                   58 	.db #0x5a	; 90	'Z'
   71C5 4A                   59 	.db #0x4a	; 74	'J'
   71C6 43                   60 	.db #0x43	; 67	'C'
   71C7 4B                   61 	.db #0x4b	; 75	'K'
   71C8                      62 _sp_platV30:
   71C8 FF                   63 	.db #0xff	; 255
   71C9 FF                   64 	.db #0xff	; 255
   71CA FF                   65 	.db #0xff	; 255
   71CB FF                   66 	.db #0xff	; 255
   71CC FF                   67 	.db #0xff	; 255
   71CD FF                   68 	.db #0xff	; 255
   71CE FF                   69 	.db #0xff	; 255
   71CF FF                   70 	.db #0xff	; 255
   71D0 FF                   71 	.db #0xff	; 255
   71D1 FF                   72 	.db #0xff	; 255
   71D2 FF                   73 	.db #0xff	; 255
   71D3 FF                   74 	.db #0xff	; 255
   71D4 FF                   75 	.db #0xff	; 255
   71D5 FF                   76 	.db #0xff	; 255
   71D6 FF                   77 	.db #0xff	; 255
   71D7 FF                   78 	.db #0xff	; 255
   71D8 FF                   79 	.db #0xff	; 255
   71D9 FF                   80 	.db #0xff	; 255
   71DA FF                   81 	.db #0xff	; 255
   71DB FF                   82 	.db #0xff	; 255
   71DC FF                   83 	.db #0xff	; 255
   71DD FF                   84 	.db #0xff	; 255
   71DE FF                   85 	.db #0xff	; 255
   71DF FF                   86 	.db #0xff	; 255
   71E0 FF                   87 	.db #0xff	; 255
   71E1 FF                   88 	.db #0xff	; 255
   71E2 FF                   89 	.db #0xff	; 255
   71E3 FF                   90 	.db #0xff	; 255
   71E4 FF                   91 	.db #0xff	; 255
   71E5 FF                   92 	.db #0xff	; 255
   71E6 FF                   93 	.db #0xff	; 255
   71E7 FF                   94 	.db #0xff	; 255
   71E8 FF                   95 	.db #0xff	; 255
   71E9 FF                   96 	.db #0xff	; 255
   71EA FF                   97 	.db #0xff	; 255
   71EB FF                   98 	.db #0xff	; 255
   71EC FF                   99 	.db #0xff	; 255
   71ED FF                  100 	.db #0xff	; 255
   71EE FF                  101 	.db #0xff	; 255
   71EF FF                  102 	.db #0xff	; 255
   71F0 FF                  103 	.db #0xff	; 255
   71F1 FF                  104 	.db #0xff	; 255
   71F2 FF                  105 	.db #0xff	; 255
   71F3 FF                  106 	.db #0xff	; 255
   71F4 FF                  107 	.db #0xff	; 255
   71F5 FF                  108 	.db #0xff	; 255
   71F6 FF                  109 	.db #0xff	; 255
   71F7 FF                  110 	.db #0xff	; 255
   71F8 FF                  111 	.db #0xff	; 255
   71F9 FF                  112 	.db #0xff	; 255
   71FA FF                  113 	.db #0xff	; 255
   71FB FF                  114 	.db #0xff	; 255
   71FC FF                  115 	.db #0xff	; 255
   71FD FF                  116 	.db #0xff	; 255
   71FE FF                  117 	.db #0xff	; 255
   71FF FF                  118 	.db #0xff	; 255
   7200 FF                  119 	.db #0xff	; 255
   7201 FF                  120 	.db #0xff	; 255
   7202 FF                  121 	.db #0xff	; 255
   7203 FF                  122 	.db #0xff	; 255
                            123 	.area _INITIALIZER
                            124 	.area _CABS (ABS)
