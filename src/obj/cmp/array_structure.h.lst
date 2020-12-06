ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 
                              2 ;;ARRAY STRUCTURE HEADER
                              3 
                              4 .macro DefineComponentArrayStructure _Tname, _N, _DefineTypeMacroDefault 
                              5 	_Tname'_num:	.db 0
                              6 	_Tname'_pend:	.dw _Tname'_array
                              7 	_Tname'_array::	
                              8 	.rept _N
                              9 		_DefineTypeMacroDefault
                             10 	.endm
                             11 .endm	
                             12 
                             13 .macro DefineComponentArrayStructure_Size _Tname, _N, _ComponentSize 
                             14 	_Tname'_num:	.db 0
                             15 	_Tname'_pend: 	.dw _Tname'_array
                             16 	_Tname'_array:	.ds 	_N * _ComponentSize
                             17 .endm
