hspd = 0;
switch(state)
{
	case(enemyState.Free):
		

//		EnemyState_Free()
		if (obj_player.x - x != 0) image_xscale = sign(obj_player.x - x);
		sprite_index = spr_skelly_idle;
		if (distance_to_object(obj_player) <= 50) and tile_meeting(x, y + 1, "GroundTiles")
		{
			image_index = 0;
			state = enemyState.Attack;
		}
		else if (distance_to_object(obj_player) <= 200)
		{
			if (tile_meeting(x + (sign(obj_player.x - x) * 32), y + 33, "GroundTiles"))
			{
				sprite_index = spr_skelly_walk;
				
				hspd = sign(obj_player.x - x) * 2;
				
				if (tile_meeting(x + (sign(obj_player.x - x) * 32), y, "GroundTiles"))
				{
					if !(tile_meeting(x + (sign(obj_player.x - x) * 32), y - 32, "GroundTiles"))
					{
						vspd = -4;
					}
				}
			}
		}
		
		
		do_collision(obj_platform, "GroundTiles");
		vspd += 0.3;
		
		break;
	case(enemyState.Hit):
		#region Hit
		if (hitNow)
		{
			if (instance_exists(oAxeEnemyHurt))
			{
				instance_destroy(oAxeEnemyHurt);
			}
			
			//change sprite to damaged animation
			sprite_index = spr_skelly_hit
			audio_play_sound(snd_skeleton_noise, 1, false)
			image_index = 0;
			hitNow = false;
			frameCount = 0;
		}
	
		//reset enemy state back to normal after gettting hit
		frameCount++;
		if (frameCount > 20) 
		{
			frameCount = 0;
			state = enemyState.Free;
		}
		#endregion
		break;
	case(enemyState.Dead):
		#region Dead
		
		if (instance_exists(oAxeEnemyHurt))
		{
			instance_destroy(oAxeEnemyHurt);
		}
		
		//simply changing sprites here
		if (sprite_index != spr_skelly_dead)
		{
			sprite_index = spr_skelly_dead;
			image_index = 0;
		}

		if (animation_end())  {
			instance_change(oAxeCorpse,true);
		}
		#endregion
		break;
	case(enemyState.Attack):
	
		sprite_index = spr_skelly_attack;
		
		while not played and image_index > 6{
			audio_play_sound(snd_sword_swing, 1, false);
			played = true
		}
		if !(instance_exists(oAxeEnemyHurt))
		{
			var hurt = instance_create_depth(x, y, depth, oAxeEnemyHurt);
			hurt.image_xscale = image_xscale;
		}
		
		if (image_index >= 17)
		{
			state = enemyState.Free;
			played = false;
		}
		
		break;
	
}