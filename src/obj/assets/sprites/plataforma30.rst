                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module plataforma30
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _sp_plat
                             12 	.globl _main_pal11
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
   73A4                      45 _main_pal11:
   73A4 54                   46 	.db #0x54	; 84	'T'
   73A5 44                   47 	.db #0x44	; 68	'D'
   73A6 5C                   48 	.db #0x5c	; 92
   73A7 58                   49 	.db #0x58	; 88	'X'
   73A8 45                   50 	.db #0x45	; 69	'E'
   73A9 52                   51 	.db #0x52	; 82	'R'
   73AA 46                   52 	.db #0x46	; 70	'F'
   73AB 5E                   53 	.db #0x5e	; 94
   73AC 40                   54 	.db #0x40	; 64
   73AD 47                   55 	.db #0x47	; 71	'G'
   73AE 42                   56 	.db #0x42	; 66	'B'
   73AF 53                   57 	.db #0x53	; 83	'S'
   73B0 5A                   58 	.db #0x5a	; 90	'Z'
   73B1 4A                   59 	.db #0x4a	; 74	'J'
   73B2 43                   60 	.db #0x43	; 67	'C'
   73B3 4B                   61 	.db #0x4b	; 75	'K'
   73B4                      62 _sp_plat:
   73B4 FF                   63 	.db #0xff	; 255
   73B5 FF                   64 	.db #0xff	; 255
   73B6 FF                   65 	.db #0xff	; 255
   73B7 FF                   66 	.db #0xff	; 255
   73B8 FF                   67 	.db #0xff	; 255
   73B9 FF                   68 	.db #0xff	; 255
   73BA FF                   69 	.db #0xff	; 255
   73BB FF                   70 	.db #0xff	; 255
   73BC FF                   71 	.db #0xff	; 255
   73BD FF                   72 	.db #0xff	; 255
   73BE FF                   73 	.db #0xff	; 255
   73BF FF                   74 	.db #0xff	; 255
   73C0 FF                   75 	.db #0xff	; 255
   73C1 FF                   76 	.db #0xff	; 255
   73C2 FF                   77 	.db #0xff	; 255
   73C3 FF                   78 	.db #0xff	; 255
   73C4 FF                   79 	.db #0xff	; 255
   73C5 FF                   80 	.db #0xff	; 255
   73C6 FF                   81 	.db #0xff	; 255
   73C7 FF                   82 	.db #0xff	; 255
   73C8 FF                   83 	.db #0xff	; 255
   73C9 FF                   84 	.db #0xff	; 255
   73CA FF                   85 	.db #0xff	; 255
   73CB FF                   86 	.db #0xff	; 255
   73CC FF                   87 	.db #0xff	; 255
   73CD FF                   88 	.db #0xff	; 255
   73CE FF                   89 	.db #0xff	; 255
   73CF FF                   90 	.db #0xff	; 255
   73D0 FF                   91 	.db #0xff	; 255
   73D1 FF                   92 	.db #0xff	; 255
   73D2 FF                   93 	.db #0xff	; 255
   73D3 FF                   94 	.db #0xff	; 255
   73D4 FF                   95 	.db #0xff	; 255
   73D5 FF                   96 	.db #0xff	; 255
   73D6 FF                   97 	.db #0xff	; 255
   73D7 FF                   98 	.db #0xff	; 255
   73D8 FF                   99 	.db #0xff	; 255
   73D9 FF                  100 	.db #0xff	; 255
   73DA FF                  101 	.db #0xff	; 255
   73DB FF                  102 	.db #0xff	; 255
   73DC FF                  103 	.db #0xff	; 255
   73DD FF                  104 	.db #0xff	; 255
   73DE FF                  105 	.db #0xff	; 255
   73DF FF                  106 	.db #0xff	; 255
   73E0 FF                  107 	.db #0xff	; 255
   73E1 FF                  108 	.db #0xff	; 255
   73E2 FF                  109 	.db #0xff	; 255
   73E3 FF                  110 	.db #0xff	; 255
   73E4 FF                  111 	.db #0xff	; 255
   73E5 FF                  112 	.db #0xff	; 255
   73E6 FF                  113 	.db #0xff	; 255
   73E7 FF                  114 	.db #0xff	; 255
   73E8 FF                  115 	.db #0xff	; 255
   73E9 FF                  116 	.db #0xff	; 255
   73EA FF                  117 	.db #0xff	; 255
   73EB FF                  118 	.db #0xff	; 255
   73EC FF                  119 	.db #0xff	; 255
   73ED FF                  120 	.db #0xff	; 255
   73EE FF                  121 	.db #0xff	; 255
   73EF FF                  122 	.db #0xff	; 255
   73F0 FF                  123 	.db #0xff	; 255
   73F1 FF                  124 	.db #0xff	; 255
   73F2 FF                  125 	.db #0xff	; 255
   73F3 FF                  126 	.db #0xff	; 255
   73F4 FF                  127 	.db #0xff	; 255
   73F5 FF                  128 	.db #0xff	; 255
   73F6 FF                  129 	.db #0xff	; 255
   73F7 FF                  130 	.db #0xff	; 255
   73F8 FF                  131 	.db #0xff	; 255
   73F9 FF                  132 	.db #0xff	; 255
   73FA FF                  133 	.db #0xff	; 255
   73FB FF                  134 	.db #0xff	; 255
   73FC FF                  135 	.db #0xff	; 255
   73FD FF                  136 	.db #0xff	; 255
   73FE FF                  137 	.db #0xff	; 255
   73FF FF                  138 	.db #0xff	; 255
   7400 FF                  139 	.db #0xff	; 255
   7401 FF                  140 	.db #0xff	; 255
   7402 FF                  141 	.db #0xff	; 255
   7403 FF                  142 	.db #0xff	; 255
   7404 FF                  143 	.db #0xff	; 255
   7405 FF                  144 	.db #0xff	; 255
   7406 FF                  145 	.db #0xff	; 255
   7407 FF                  146 	.db #0xff	; 255
   7408 FF                  147 	.db #0xff	; 255
   7409 FF                  148 	.db #0xff	; 255
   740A FF                  149 	.db #0xff	; 255
   740B FF                  150 	.db #0xff	; 255
   740C FF                  151 	.db #0xff	; 255
   740D FF                  152 	.db #0xff	; 255
   740E FF                  153 	.db #0xff	; 255
   740F FF                  154 	.db #0xff	; 255
   7410 FF                  155 	.db #0xff	; 255
   7411 FF                  156 	.db #0xff	; 255
   7412 FF                  157 	.db #0xff	; 255
   7413 FF                  158 	.db #0xff	; 255
   7414 FF                  159 	.db #0xff	; 255
   7415 FF                  160 	.db #0xff	; 255
   7416 FF                  161 	.db #0xff	; 255
   7417 FF                  162 	.db #0xff	; 255
   7418 FF                  163 	.db #0xff	; 255
   7419 FF                  164 	.db #0xff	; 255
   741A FF                  165 	.db #0xff	; 255
   741B FF                  166 	.db #0xff	; 255
   741C FF                  167 	.db #0xff	; 255
   741D FF                  168 	.db #0xff	; 255
   741E FF                  169 	.db #0xff	; 255
   741F FF                  170 	.db #0xff	; 255
   7420 FF                  171 	.db #0xff	; 255
   7421 FF                  172 	.db #0xff	; 255
   7422 FF                  173 	.db #0xff	; 255
   7423 FF                  174 	.db #0xff	; 255
   7424 FF                  175 	.db #0xff	; 255
   7425 FF                  176 	.db #0xff	; 255
   7426 FF                  177 	.db #0xff	; 255
   7427 FF                  178 	.db #0xff	; 255
   7428 FF                  179 	.db #0xff	; 255
   7429 FF                  180 	.db #0xff	; 255
   742A FF                  181 	.db #0xff	; 255
   742B FF                  182 	.db #0xff	; 255
                            183 	.area _INITIALIZER
                            184 	.area _CABS (ABS)
