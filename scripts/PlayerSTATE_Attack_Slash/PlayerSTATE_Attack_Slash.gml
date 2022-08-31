// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// melee attack - 

function PlayerSTATE_Attack_Slash() {
	hspd = 0;
	vspd = 0;
	
	//activates attack
	ProcessAttack(spr_warrior_attack, spr_warrior_attackHB);
	
	//Trigger combo chain
	//at a certain frame of the animation, that is when the combo attack can play
	if (mouse_check_button_pressed(mb_left) and (image_index > 4)) {
		state = global.ATTACKCOMBO
		
	}

	if (animation_end()) {
		sprite_index = spr_Warrior_Idle;
		state = global.PLAYERSTATEFREE;
	}
}


