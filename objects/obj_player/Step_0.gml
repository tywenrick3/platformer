
//Reference for the different player state scripts
// https://youtu.be/-0bckaBj__M -- State Machines
//https://forum.yoyogames.com/index.php?threads/state-machine.41371/

//This code organizes which state the player is in such as:
// Movement, jumping, speed state
//Attacking state

//this same process was applied to the enemy states as well



switch(state)
{
	case(global.PLAYERSTATEFREE): // Base movemenmt and abilities
	
		PlayerSTATE_Free();
		
		break;
		
	case(playerStates.swing): // Swing/Grappling abilities
	
		#region swing
		sprite_index = spr_warrior_grapple;
		
		var left = keyboard_check(ord("A")) or keyboard_check(vk_left);
		var right = keyboard_check(ord("D")) or keyboard_check(vk_right);
		
		var up = keyboard_check(ord("W"));
		var down = keyboard_check(ord("S"));
		

		var jump = keyboard_check_pressed(vk_space);
	
		var ropeAngleAcceleration = -0.2 * dcos(ropeAngle);
		
		
		if (!tile_meeting(x + right - left, y, "GroundTiles") and !place_meeting(x + right - left, y, obj_collidable))
		{
			ropeAngleAcceleration += (right - left) * 0.08; // Swings
		}
		
		
		if (!tile_meeting(x, y + down - up, "GroundTiles") and !place_meeting(x, y + down - up, obj_collidable))
		{
			ropeLength += (down - up); //Climps up and down
		}
		
		
 		ropeAngleVelocity += ropeAngleAcceleration;
		
		ropeAngle += ropeAngleVelocity;
		ropeAngleVelocity *= 0.99;
		
		ropeX = grappleX + lengthdir_x(ropeLength, ropeAngle);	
		ropeY = grappleY + lengthdir_y(ropeLength, ropeAngle);
		
		hspd = ropeX - x;
		vspd = ropeY - y;
		
		if (right - left != 0) image_xscale = (right - left); // Faces to where player input is
		
		if (jump)
		{
			vspd = -15;
			state = global.PLAYERSTATEFREE;
		}
		
		do_collision(obj_collidable, "GroundTiles");
		
		#endregion
		break;
		
	case(global.ATTACKSLASH): // Attacking
		
		PlayerSTATE_Attack_Slash();
		
		break;
		
	case(global.ATTACKCOMBO): //Attack combo
	
		PlayerSTATE_Attack_Combo();
		
		break;
		
	case(playerStates.hurt):
		
		#region hit
		sprite_index = spr_warrior_hurt;
		if image_index > 1 and not grunt_played {
			audio_play_sound(snd_grunt, 1, false)
			grunt_played = true
		}
		
		image_index = clamp(image_index, 0, 3);
		
		if (gotHit == false) //Code to be executed right after getting hit
		{
			tick = 0; // Ticks (adds one per frame)
			image_index = 0;
			_dir = sign(x - instance_nearest(x, y, pEnemy).x); // Detects where the enemy is in relation of the player
			vspd = -6;
			gotHit = true;
			grunt_played = false;
			
			while (rubies != 0) // Drops the rubies
			{
				instance_create_depth(x, y, depth, oRubyHit);
				rubies--;
			}
		}
		
		///
		
		if (tick < 2) // Makes the grounded variable to be false for 2 frames, just so it won't change the player state right after entering it
		{
			tick++;
			var grounded = false;
		}
		else
		{
			var grounded = place_meeting(x, y+1, obj_collidable) or tile_meeting(x, y+1, "GroundTiles");
		}
		
		///
		
		if (!grounded) // Checks if the player already hit the ground. If they didn't, they'll move horizontally, like in Megaman games
		{
			hspd = _dir * 5;
		}
		else if (grounded)
		{
			gotHit = false; // Resets the just-hit variable
			invencibility = 60; // Gives the player a second of invencibility
			state = playerStates.playerstatefree;	
		}
		
		do_collision(obj_collidable, "GroundTiles"); // Collision script
		
		vspd += 0.3;
		#endregion
		break;
		
	case(playerStates.dead):
		
		#region die
		sprite_index = spr_warrior_hurt;
		
		image_index = clamp(image_index, 0, 3);
		
		if (gotHit == false) //Code to be executed right after getting hit
		{
			obj_camera.follow = noone;
			image_index = 0;
			_dir = sign(x - instance_nearest(x, y, pEnemy).x); // Detects where the enemy is in relation of the player
			vspd = -7;
			gotHit = true;
		}
		
		hspd = _dir * 5;
		vspd += 0.4;
		
		x += hspd;
		y += vspd;
		
		#endregion
		
		break;
		
	case(playerStates.airattack):
		
		vspd += 0.6;
		hspd = 0;
		var grounded = place_meeting(x, y+1, obj_collidable) or tile_meeting(x, y+1, "GroundTiles");
		sprite_index = spr_warrior_attack;
		
		
		if (!grounded)
		{
			if (image_index > 4)
			{
				image_speed = 0;
			}
		}
		else if (grounded or place_meeting(x, y, pEnemy))
		{
			image_speed = 3;
			
			
			////
			
			hspd = 0;
	
			//activates attack
			ProcessAttack(spr_warrior_attack, spr_warrior_attackHB);
			
			///////////
			
			//Start of the attack

			if (sprite_index != spr_warrior_attack) {
	
				sprite_index = spr_warrior_attack;
				ds_list_clear(hitByAttack);
	
			}

			//use attack hitbox and check for hits
			//used the documentation for how to implement the lists and also the reference from before:
			//https://www.reddit.com/r/gamemaker/comments/6i6wzq/using_ds_lists_to_handle_hits_for_multiple/
			var hitByAttackNow = ds_list_create();
			var hits = instance_place_list(x,y,pEnemy,hitByAttackNow,false);
			if (hits > 0) { 
	
				for (var i = 0; i < hits; i++)	{
		
					//if this instance has not yet been hit by this attack
					var hitID = ds_list_find_value(hitByAttackNow, i);
					if (ds_list_find_index(hitByAttack, hitID) == -1) {
						ds_list_add(hitByAttack, hitID);		
				
						with (hitID) {
							EnemyHit(2);
						}
					}
				}
			}
			ds_list_destroy(hitByAttackNow);
			
			image_speed = 1;
			
			///////////
			
			//Trigger combo chain
			//at a certain frame of the animation, that is when the combo attack can play


			if (animation_end()) {
				invencibility = 30;
				sprite_index = spr_Warrior_Idle;
				state = global.PLAYERSTATEFREE;
			}
			
			////
		}
		
		do_collision(obj_platform, "GroundTiles");
		
		break;
}


// Source for parallax code: https://forum.yoyogames.com/index.php?threads/parallax-scrolling-backgrounds.25444/
var _cam_x = camera_get_view_x(view_camera[0]) ;
layer_x("foreground", _cam_x * 0.25); // Change the background layer name to whatever you use in the room editor
layer_x("middleground", _cam_x * 0.5);   // Change the 0.25 and 0.5 values to change the speed of the effect
layer_x("middleground_green", _cam_x * 0.7);   // Change the 0.25 and 0.5 values to change the speed of the effect

timeTick++
if (timeTick >= 60)
{
	timeTick = 0;
	seconds++;
	
	if (seconds >= 60)
	{
		minutes++;
		seconds = 0;
	}
}