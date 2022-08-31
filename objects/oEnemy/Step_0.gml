

//idle
switch(state)
{
	case(enemyState.Free):
		sprite_index = spr_runner;
		image_xscale = _direction;
		
		hspd = 0;
		


		if (tile_meeting(x + (_direction * 32), y + 33, "GroundTiles"))
		{
			
			hspd = _direction * 2;
				
			if (tile_meeting(x + (_direction * 32), y, "GroundTiles"))
			{
				if (tile_meeting(x, y + 1, "GroundTiles") and changeCooldown >= 60)
				{
					_direction *= -1;
					changeCooldown = 0;
				}
			}
		}
		else
		{
			if (tile_meeting(x, y + 1, "GroundTiles") and changeCooldown >= 60)
			{
				_direction *= -1;
				changeCooldown = 0;
			}
		}
		
		changeCooldown++;
		
		do_collision(obj_platform, "GroundTiles");
		vspd += 0.3;
		
		break;
	case(enemyState.Hit):
		#region Hit
		

		if (frameCount >= 10 and tile_meeting(x, y + 1, "GroundTiles"))
		{
			state = enemyState.Free;
			frameCount = 0;
		}
		
		frameCount++; 
		
		image_index = clamp(image_index, 0, 7);
		
		if (gotHit == false) //Code to be executed right after getting hit
		{
			sprite_index = spr_runner_hit;
			image_index = 0;
			_dir = sign(x - obj_player.x); // Detects where the enemy is in relation of the player
			vspd = -4;
			gotHit = true;
		}
		
		hspd = _dir * 2;
		vspd +=	0.3;
			
		do_collision(obj_platform, "GroundTiles")
		
		#endregion
		break;
	case(enemyState.Dead):
		#region Dead
		//simply changing sprites here
		if (sprite_index != spr_runner_dead)
		{
			sprite_index = spr_runner_dead;
			image_index = 0;
		}

		if (animation_end())  {
			instance_change(oCorpse,true);
		}
		#endregion
		break;
}