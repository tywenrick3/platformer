// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// melee attack combo
//attack combo idea reference - https://forum.yoyogames.com/index.php?threads/3-hit-combo.25513/

function PlayerSTATE_Attack_Combo() {

	hspd = 0;
	vspd = 0;
	
	//activates attack
	ProcessAttack(spr_warrior_attackCombo, spr_warrior_attackComboHB);
	
	//Trigger combo chain
	if (mouse_check_button_pressed(mb_left) and (image_index > 3)) {
		
		state = global.ATTACKSLASH;
	}

	if (animation_end()) {
		sprite_index = spr_Warrior_Idle;
		state = global.PLAYERSTATEFREE;
	}
}