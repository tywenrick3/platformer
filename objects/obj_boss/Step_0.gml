grounded = tile_meeting(x, y + 1, "GroundTiles")


vspd += 0.5;


if (tick >= 60 * 10)
{
	if (specialReady != true)
	{
		if (hp < 0) // Chooses between tho attacks based on the hp quantity
		{
			specialAttack = "jump";
		}
		else if (hp > 0)
		{
			specialAttack = "run";
		}
	}
	specialReady = true;
}

switch(state)
{
	case(BossStates.idle):
	
		var _dir = 0;
		if (obj_player_boss.x - x != 0)
		{
			_dir = sign(obj_player_boss.x - x);
		}
	
		if (obj_player_boss.x - x > 50 or obj_player_boss.x - x < 50)
		{
			if (_dir != 0) image_xscale = (xScaleStart * _dir)
		}
		hspd = (_dir) * spd; // Follows the player
	
		if (hspd != 0)
		{
			sprite_index = spr_boss_walk;
		}
		else
		{
			sprite_index = spr_boss_idle;
		}
	
	
		if (specialReady == true) // Does the special attack
		{
			if (specialAttack == "run")
			{
				if (tile_meeting(x + 15, y, "GroundTiles"))
				{
					state = BossStates.special;
				}
				else
				{
					image_xscale = (xScaleStart)
					hspd = 1 * 4;
				}
			}
			else if (specialAttack == "jump")
			{
				prepareJumpTick++;
				hspd = 0;
				if (prepareJumpTick >= 90)
				{
					vspd = -50;
					prepareJumpTick = 0;
					state = BossStates.jump;
				}
			}
		}
		else if (distance_to_object(obj_player_boss) < 50) and (colTick > attackCooldown)
		{
			colTick = 0;
			state = BossStates.attack;
		}
	
		colTick++;
	
		break;
		
	case(BossStates.attack):
		hspd = 0;
	
		if !(sprite_index == spr_boss_attack)	
		{
			sprite_index = spr_boss_attack;
			if image_index > 3 and not played{
				audio_play_sound(snd_boss_swing, 1, false);
				played = true
			}
			
			var hit = instance_create_depth(x, y, depth, obj_boss_hurt);
			hit.image_xscale = image_xscale;
			hit.image_yscale = image_yscale;
			image_index = 0;
		}
		if (sprite_index == spr_boss_attack and animation_end())
		{
			state = BossStates.idle;
			played = false
		}
	
		break;
		
	case(BossStates.special):
		
		
		if (sprintTo == 0) sprintTo = sign(obj_player_boss.x - x);
		
		if !(sprite_index == spr_boss_run)	
		{
			sprite_index = spr_boss_run;
			image_index = 0;
		}
		
		hspd = (sprintTo) * 6; // Sprints
		image_xscale = (xScaleStart * sign(hspd))
		
		if (tile_meeting(x + hspd, y, "GroundTiles"))
		{
			tick = 0;
			sprintTo = 0;
			specialReady = false;
			state = BossStates.idle;
		}
		break;
	case(BossStates.dead):
		if !(sprite_index == spr_boss_death)	
		{
			sprite_index = spr_boss_death;
			image_index = 0;
		}
		
		if (animation_end())
		{
			image_speed = 0;
		}
		break;
		
	case(BossStates.jump):
		x += (obj_player_boss.x - x) / 34;
		
		if (prepareJumpTick >= 5 * 60)
		{
			vspd += 0.9;
		}
		else if (prepareJumpTick > 60)
		{
			vspd = 0;
		}
		prepareJumpTick++;
		
		if (tile_meeting(x, y + 1, "GroundTiles"))
		{
			var _dir = 0;
			if (obj_player_boss.x - x != 0)
			{
				_dir = sign(obj_player_boss.x - x);
			}
	
			if (obj_player_boss.x - x > 50 or obj_player_boss.x - x < 50)
			{
				if (_dir != 0) image_xscale = (xScaleStart * _dir)
			}
			specialReady = false;
			tick = 0;
			state = BossStates.attack;
		}
		break;
}


if (hp <= -50)
{
	hspd = 0;
	state = BossStates.dead;
	instance_destroy(obj_boss_hurt);
	
	if !(instance_exists(obj_lead_player_boss))
	{
		instance_create_depth(obj_player_boss.x, obj_player_boss.y, depth, obj_lead_player_boss);
	}
}


do_collision(noone,"GroundTiles");

tick++;