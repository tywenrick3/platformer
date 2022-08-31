// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


//ideas to implement the hitbox - reference:
//https://www.reddit.com/r/gamemaker/comments/abbdk6/how_do_i_stick_a_hitbox_to_my_melee_attack/

//2nd reference:
//https://www.reddit.com/r/gamemaker/comments/553qnq/problem_with_hitboxes_and_damaging_enemies/

//parameters takes in the aniamtion for the sprite attack and the sprite hitbox,
//so that i can set up an attack combo
function ProcessAttackBoss(argument0, argument1){


	//Start of the attack

	if (sprite_index != argument0) {
	
		sprite_index = argument0;
		image_index = 0;
		ds_list_clear(hitByAttack);
	
	}

	//use attack hitbox and check for hits
	//used the documentation for how to implement the lists and also the reference from before:
	//https://www.reddit.com/r/gamemaker/comments/6i6wzq/using_ds_lists_to_handle_hits_for_multiple/
	mask_index = argument1;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x,y,obj_boss,hitByAttackNow,false);
	if (hits > 0) { 
	
		for (var i = 0; i < hits; i++)	{
		
			//if this instance has not yet been hit by this attack
			var hitID = ds_list_find_value(hitByAttackNow, i);
			if (ds_list_find_index(hitByAttack, hitID) == -1) {
				ds_list_add(hitByAttack, hitID);		
				
				with (hitID) 
				{
					got_hit = true;
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = spr_Warrior_Idle;
}