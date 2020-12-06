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

;;ALL MUTLIPLAYER LEVELS

level1_multi_ent1: DefineCmp_Entity 0, 150, 0, 0, 4, 16, _sp_char_multi1, e_ai_st_noAI, 3, 0, 1, 1, 0
level1_multi_ent2: DefineCmp_Entity 74, 150, 0, 0, 4, 16, _sp_char_multi2, e_ai_st_noAIMulti, 4, 0, 1, 1, 0
level1_multi_ent3: DefineCmp_Entity 30, 170, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level1_multi_ent4: DefineCmp_Entity 50, 170, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
;;final

man_level1_multi_init::

	ld hl, #level1_multi_ent1
	call man_entity_create
	call sys_eren_borrar	
	ld hl, #level1_multi_ent2
	call man_entity_create
	ld hl, #level1_multi_ent3
	call man_entity_create
	ld hl, #level1_multi_ent4
	call man_entity_create

	ret

level2_multi_ent1: DefineCmp_Entity 0, 150, 0, 0, 4, 16, _sp_char_multi1, e_ai_st_noAI, 3, 0, 1, 1, 0
level2_multi_ent2: DefineCmp_Entity 74, 150, 0, 0, 4, 16, _sp_char_multi2, e_ai_st_noAIMulti, 4, 0, 1, 1, 0
level2_multi_ent3: DefineCmp_Entity 39, 70, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level2_multi_ent4: DefineCmp_Entity 25, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level2_multi_ent5: DefineCmp_Entity 10, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level2_multi_ent6: DefineCmp_Entity 40, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0
level2_multi_ent7: DefineCmp_Entity 39, 108, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level2_multi_ent8: DefineCmp_Entity 55, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0

;;final

man_level2_multi_init::

	ld hl, #level2_multi_ent1
	call man_entity_create
	call sys_eren_borrar	
	ld hl, #level2_multi_ent2
	call man_entity_create
	ld hl, #level2_multi_ent3
	call man_entity_create
	ld hl, #level2_multi_ent4
	call man_entity_create
	ld hl, #level2_multi_ent5
	call man_entity_create
	ld hl, #level2_multi_ent6
	call man_entity_create
	ld hl, #level2_multi_ent7
	call man_entity_create
	ld hl, #level2_multi_ent8
	call man_entity_create

	ret

level3_multi_ent1: DefineCmp_Entity 0, 150, 0, 0, 4, 16, _sp_char_multi1, e_ai_st_noAI, 3, 0, 1, 1, 0
level3_multi_ent2: DefineCmp_Entity 74, 150, 0, 0, 4, 16, _sp_char_multi2, e_ai_st_noAIMulti, 4, 0, 1, 1, 0
level3_multi_ent3: DefineCmp_Entity 15, 0, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level3_multi_ent4: DefineCmp_Entity 15, 30, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level3_multi_ent5: DefineCmp_Entity 15, 110, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level3_multi_ent6: DefineCmp_Entity 15, 140, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level3_multi_ent7: DefineCmp_Entity 15, 170, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0

level3_multi_ent8: DefineCmp_Entity 33, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0

level3_multi_ent9: DefineCmp_Entity 63, 0, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level3_multi_ent10: DefineCmp_Entity 63, 30, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level3_multi_ent11: DefineCmp_Entity 63, 60, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level3_multi_ent12: DefineCmp_Entity 63, 90, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
level3_multi_ent13: DefineCmp_Entity 63, 120, 0, 0, 2, 30, _sp_platV30, e_ai_st_noAI, 1, 0, 0, 0, 0
;;final

man_level3_multi_init::

	ld hl, #level3_multi_ent1
	call man_entity_create
	call sys_eren_borrar	
	ld hl, #level3_multi_ent2
	call man_entity_create
	ld hl, #level3_multi_ent3
	call man_entity_create
	ld hl, #level3_multi_ent4
	call man_entity_create
	ld hl, #level3_multi_ent5
	call man_entity_create
	ld hl, #level3_multi_ent6
	call man_entity_create
	ld hl, #level3_multi_ent7
	call man_entity_create
	ld hl, #level3_multi_ent8
	call man_entity_create
	ld hl, #level3_multi_ent9
	call man_entity_create
	ld hl, #level3_multi_ent10
	call man_entity_create
	ld hl, #level3_multi_ent11
	call man_entity_create
	ld hl, #level3_multi_ent12
	call man_entity_create
	ld hl, #level3_multi_ent13
	call man_entity_create

	ret




