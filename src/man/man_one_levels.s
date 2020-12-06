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

.include "man/man_game.h.s"
.include "man/man_entity.h.s"
.include "sys/sys_render.h.s"
.include "cmp/entity.h.s"
.include "assets/assets.h.s"


;;AQUI SE ENCUENTREAN TODOS LOS NIVELES INDIVIDUALES

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
level1_ent1: DefineCmp_Entity 0, 150, 0, 0, 4, 16, _sp_mainchar, e_ai_st_noAI, 3, 0, 1, 1, 0
level1_ent2: DefineCmp_Entity 25, 170, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level1_ent3: DefineCmp_Entity 50, 170, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0


;;final
level1_ent5: DefineCmp_Entity 70, 175, 0, 0, 4, 16, _sp_final, e_ai_st_noAI, 1, 0, 0, 0, 1

man_level1_init::

	ld hl, #level1_ent1
	call man_entity_create
	call sys_eren_borrar	
	ld hl, #level1_ent2
	call man_entity_create
	ld hl, #level1_ent3
	call man_entity_create
	;ld hl, #jaj
	;call man_entity_create
	;ld hl, #level1_ent6
	;call man_entity_create
	ld hl, #level1_ent5
	call man_entity_create
	;ld hl, #ent3
	;call man_entity_create
	;ld hl, #ent4
	;call man_entity_create

	ret

level2_ent1: DefineCmp_Entity 64, 150, 0, 0, 4, 16, _sp_mainchar, e_ai_st_noAI, 3, 0, 1, 1, 0
level2_ent2: DefineCmp_Entity 60, 162, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level2_ent3: DefineCmp_Entity 60, 192, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level2_ent4: DefineCmp_Entity 60, 132, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level2_ent5: DefineCmp_Entity 60, 102, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level2_ent6: DefineCmp_Entity 45, 102, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level2_ent7: DefineCmp_Entity 15, 102, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level2_ent8: DefineCmp_Entity 20, 192, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level2_ent9: DefineCmp_Entity 0, 102, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level2_ent10: DefineCmp_Entity 4, 192, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 2, 1, 0
level2_ent11: DefineCmp_Entity 36, 192, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 2, 1, 0

;;final
level2_ent12: DefineCmp_Entity 15, 130, 0, 0, 4, 16, _sp_final, e_ai_st_noAI, 1, 0, 0, 0, 1


man_level2_init::

	ld hl, #level2_ent1
	call man_entity_create
	call sys_eren_borrar	
	ld hl, #level2_ent2
	call man_entity_create
	;ld hl, #ent3
	;call man_entity_create
	ld hl, #level2_ent3
	call man_entity_create
	ld hl, #level2_ent4
	call man_entity_create
	ld hl, #level2_ent5
	call man_entity_create
	ld hl, #level2_ent6
	call man_entity_create
	ld hl, #level2_ent7
	call man_entity_create
	ld hl, #level2_ent8
	call man_entity_create
	ld hl, #level2_ent9
	call man_entity_create
	ld hl, #level2_ent10
	call man_entity_create
	ld hl, #level2_ent11
	call man_entity_create
	ld hl, #level2_ent12
	call man_entity_create

	ret


level3_ent1: DefineCmp_Entity 5, 0, 0, 0, 4, 16, _sp_mainchar, e_ai_st_noAI, 3, 0, 1, 1, 0
level3_ent2: DefineCmp_Entity 60, 30, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level3_ent3: DefineCmp_Entity 0, 30, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level3_ent4: DefineCmp_Entity 60, 60, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level3_ent5: DefineCmp_Entity 60, 90, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level3_ent6: DefineCmp_Entity 45, 112, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level3_ent7: DefineCmp_Entity 60, 0, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level3_ent8: DefineCmp_Entity 30, 112, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level3_ent9: DefineCmp_Entity 5, 192, 0, 0, 60, 8, _sp_rojo_grande,  e_ai_st_noAI, 2, 1, 1, 1, 0
;level3_ent10: DefineCmp_Entity 15, 192, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 0, 0
;level3_ent11: DefineCmp_Entity 30, 192, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 0, 0
;level3_ent12: DefineCmp_Entity 45, 192, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 0, 0
;level3_ent13: DefineCmp_Entity 60, 192, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 0, 0

;;final
level3_ent14: DefineCmp_Entity 64, 40, 0, 0, 4, 16, _sp_final, e_ai_st_noAI, 1, 0, 0, 0, 1


man_level3_init::

	ld hl, #level3_ent1
	call man_entity_create
	call sys_eren_borrar	
	ld hl, #level3_ent2
	call man_entity_create
	ld hl, #level3_ent3
	call man_entity_create
	ld hl, #level3_ent4
	call man_entity_create
	ld hl, #level3_ent5
	call man_entity_create
	ld hl, #level3_ent6
	call man_entity_create
	ld hl, #level3_ent7
	call man_entity_create
	ld hl, #level3_ent8
	call man_entity_create
	ld hl, #level3_ent9
	call man_entity_create
	ld hl, #level3_ent14
	call man_entity_create
	ret


level4_ent1: DefineCmp_Entity 60, 50, 0, 0, 4, 16, _sp_mainchar, e_ai_st_noAI, 3, 0, 1, 1, 0
level4_ent2: DefineCmp_Entity 50, 70, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level4_ent3: DefineCmp_Entity 34, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level4_ent4: DefineCmp_Entity 49, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level4_ent5: DefineCmp_Entity 64, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level4_ent6: DefineCmp_Entity 30, 70, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level4_ent7: DefineCmp_Entity 19, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level4_ent8: DefineCmp_Entity 5, 192, 0, 0, 60, 8, _sp_rojo_grande,  e_ai_st_noAI, 2, 1, 1, 1, 0
level4_ent9: DefineCmp_Entity 33,90, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 1, 0

;;final
level4_ent10: DefineCmp_Entity 64, 120, 0, 0, 4, 16, _sp_final, e_ai_st_noAI, 1, 0, 0, 0, 1


man_level4_init::

	ld hl, #level4_ent1
	call man_entity_create
	call sys_eren_borrar	
	ld hl, #level4_ent2
	call man_entity_create
	ld hl, #level4_ent3
	call man_entity_create
	ld hl, #level4_ent4
	call man_entity_create
	ld hl, #level4_ent5
	call man_entity_create
	ld hl, #level4_ent6
	call man_entity_create
	ld hl, #level4_ent7
	call man_entity_create
	ld hl, #level4_ent8
	call man_entity_create
	ld hl, #level4_ent9
	call man_entity_create
	ld hl, #level4_ent10
	call man_entity_create

	ret



level5_ent1: DefineCmp_Entity 0, 50, 0, 0, 4, 16, _sp_mainchar, e_ai_st_noAI, 3, 0, 1, 1, 0
level5_ent2: DefineCmp_Entity 15, 0, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level5_ent3: DefineCmp_Entity 0, 122, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level5_ent4: DefineCmp_Entity 15, 70, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level5_ent5: DefineCmp_Entity 15, 100, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level5_ent6: DefineCmp_Entity 18, 130, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 1, 0
level5_ent7: DefineCmp_Entity 50, 0, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level5_ent8: DefineCmp_Entity 50, 30, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level5_ent9: DefineCmp_Entity 50, 110, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level5_ent10: DefineCmp_Entity 34,130, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 1, 0

;;final
level5_ent11: DefineCmp_Entity 64, 120, 0, 0, 4, 16, _sp_final, e_ai_st_noAI, 1, 0, 0, 0, 1


man_level5_init::

	ld hl, #level5_ent1
	call man_entity_create
	call sys_eren_borrar	
	ld hl, #level5_ent2
	call man_entity_create
	ld hl, #level5_ent3
	call man_entity_create
	ld hl, #level5_ent4
	call man_entity_create
	ld hl, #level5_ent5
	call man_entity_create
	ld hl, #level5_ent6
	call man_entity_create
	ld hl, #level5_ent7
	call man_entity_create
	ld hl, #level5_ent8
	call man_entity_create
	ld hl, #level5_ent9
	call man_entity_create
	ld hl, #level5_ent10
	call man_entity_create
	ld hl, #level5_ent11
	call man_entity_create

	ret

level6_ent1: DefineCmp_Entity 64, 50, 0, 0, 4, 16, _sp_mainchar, e_ai_st_noAI, 3, 0, 1, 1, 0
level6_ent2: DefineCmp_Entity 20, 70, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level6_ent3: DefineCmp_Entity 20, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level6_ent4: DefineCmp_Entity 35, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level6_ent5: DefineCmp_Entity 50, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level6_ent6: DefineCmp_Entity 65, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level6_ent7: DefineCmp_Entity 5, 192, 0, 0, 60, 8, _sp_rojo_grande,  e_ai_st_noAI, 2, 1, 1, 1, 0
;level6_ent8: DefineCmp_Entity 5, 0, 0, 0, 60, 8, _sp_rojo_grande,  e_ai_st_noAI, 2, 1, 1, 1, 0
level6_ent9: DefineCmp_Entity 50, 70, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level6_ent10: DefineCmp_Entity 50, 108, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level6_ent11: DefineCmp_Entity 20, 108, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0

;level6_ent4: DefineCmp_Entity 18, 130, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 1, 0
;;final
level6_ent12: DefineCmp_Entity 64, 120, 0, 0, 4, 16, _sp_final, e_ai_st_noAI, 1, 0, 0, 0, 1


man_level6_init::

	ld hl, #level6_ent1
	call man_entity_create
	call sys_eren_borrar	
	ld hl, #level6_ent2
	call man_entity_create
	ld hl, #level6_ent3
	call man_entity_create
	ld hl, #level6_ent4
	call man_entity_create
	ld hl, #level6_ent5
	call man_entity_create
	ld hl, #level6_ent6
	call man_entity_create
	ld hl, #level6_ent7
	call man_entity_create
	;ld hl, #level6_ent8
	;call man_entity_create
	ld hl, #level6_ent9
	call man_entity_create
	ld hl, #level6_ent10
	call man_entity_create
	ld hl, #level6_ent11
	call man_entity_create
	ld hl, #level6_ent12
	call man_entity_create

	ret

level7_ent1: DefineCmp_Entity 0, 0, 0, 0, 4, 16, _sp_mainchar, e_ai_st_noAI, 3, 0, 1, 1, 0
level7_ent2: DefineCmp_Entity 15, 0, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level7_ent3: DefineCmp_Entity 15, 30, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level7_ent4: DefineCmp_Entity 15, 60, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level7_ent5: DefineCmp_Entity 25, 150, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level7_ent6: DefineCmp_Entity 16, 192, 0, 0, 60, 8, _sp_rojo_grande,  e_ai_st_noAI, 2, 1, 1, 1, 0
level7_ent7: DefineCmp_Entity 0, 192, 0, 0, 15, 8, _sp_rojo,  e_ai_st_noAI, 2, 1, 1, 1, 0
level7_ent8: DefineCmp_Entity 63, 30, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level7_ent9: DefineCmp_Entity 63, 60, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level7_ent10: DefineCmp_Entity 63, 90, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level7_ent11: DefineCmp_Entity 63, 22, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0

;;final
level7_ent12: DefineCmp_Entity 65, 50, 0, 0, 4, 16, _sp_final, e_ai_st_noAI, 1, 0, 0, 0, 1


man_level7_init::

	ld hl, #level7_ent1
	call man_entity_create
	call sys_eren_borrar	
	ld hl, #level7_ent2
	call man_entity_create
	ld hl, #level7_ent3
	call man_entity_create
	ld hl, #level7_ent4
	call man_entity_create
	ld hl, #level7_ent5
	call man_entity_create
	ld hl, #level7_ent6
	call man_entity_create
	ld hl, #level7_ent7
	call man_entity_create
	ld hl, #level7_ent8
	call man_entity_create
	ld hl, #level7_ent9
	call man_entity_create
	ld hl, #level7_ent10
	call man_entity_create
	ld hl, #level7_ent11
	call man_entity_create
	ld hl, #level7_ent12
	call man_entity_create
	
	ret
