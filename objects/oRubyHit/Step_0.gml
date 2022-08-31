if (instance_exists(obj_player) or instance_exists(obj_player_boss))
{
	if (tick != 1)
	{
		var grounded = false;
		tick++;
	}
	else
	{
		var grounded = place_meeting(x, y + 5, obj_platform) or tile_meeting(x, y + 5, "GroundTiles");
	}
	
	
	//do_collision(obj_platform)
	
	if (place_meeting(x, y, obj_player) and grounded)
	{
		obj_player.rubies++;
		audio_play_sound(snd_gem, 1, false)
		instance_destroy();
	}
	if (place_meeting(x, y, obj_player_boss) and grounded)
	{
		obj_player_boss.rubies++;
		audio_play_sound(snd_gem, 1, false)
		instance_destroy();
	}
	
	
	if (!grounded)
	{
		if (!place_meeting(x, y + vspd, obj_platform))
		{
			y += vspd;
			x += hspd * spd;
		}
		else if (sign(vspd) == 1)
		{
			y += vspd;
			x += hspd * spd;
		}
		vspd += 0.3;
	}
}