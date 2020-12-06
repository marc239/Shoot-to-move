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

;;GAME MANAGER

.include "cpctelera.h.s"
.include "cmp/entity.h.s"
.include "sys/sys_physics.h.s"
.include "sys/sys_render.h.s"
.include "sys/sys_input.h.s"
.include "sys/sys_ai_control.h.s"
.include "sys/sys_collision.h.s"
.include "sys/sys_dash.h.s"
.include "sys/sys_death.h.s"
.include "man/man_entity.h.s"
.include "man/man_patrol.h.s"
.include "man/man_multiplayer.h.s"
.include "assets/assets.h.s"

.module game_manager

ent1: DefineCmp_Entity 70, 0, 0, 0, 4, 16, _sp_mainchar, e_ai_st_noAI, 0, 0, 0, 1, 0
ent2: DefineCmp_Entity 40, 100, 0, 0, 4, 8, _sp_redball,  e_ai_st_stand_by, 1, 0, 1, 1, 0
ent4: DefineCmp_Entity 0, 100, 0, 0, 15, 8, _sp_plat, e_ai_st_noAI, 1, 0, 0, 0, 0





man_game_render::

	;cpctm_setBorder_asm HW_RED ;;ESTO nos permite probar cuanto tardamos en renderizar

	call man_entity_getArray
	call sys_eren_update

	;cpctm_setBorder_asm HW_WHITE


	ret

man_game_init::

	call man_entity_init		;; HL = Entity array
	call man_patrol_init

	;;INICIA SISTEMAS
	call man_entity_getArray
	call sys_ai_control_init
	call sys_physics_init
	call man_entity_getArray

	call sys_input_init
	call man_entity_getArray
	call sys_eren_init

	ret





man_game_update::
	
	call man_entity_getArray
	call sys_input_update

	call man_entity_getArray
	call sys_ai_control_update

	call man_entity_getArray
	call sys_collision_update_hero
	call man_entity_getArray
	call sys_collision_update_dmg

	call man_entity_getArray
	call sys_physics_update

	call man_entity_getArray
	call sys_death_update


	ret



man_game_update_multi::
	
	call man_entity_getArray
	call sys_input_update

	call man_entity_getArray
	ld bc, #sizeof_e
	add ix, bc ;;pasamos a la segunda entidad
	call man_multiplayer_input_update

	call man_entity_getArray
	call sys_ai_control_update

	call man_entity_getArray
	call sys_collision_update_hero

	call man_entity_getArray
	ld bc, #sizeof_e
	add ix, bc ;;pasamos a la segunda entidad
	dec a
	call sys_collision_update_hero2

	call man_entity_getArray
	call sys_collision_update_dmg

	call man_entity_getArray
	call sys_physics_update

	call man_entity_getArray
	call sys_death_update_multi


	ret
