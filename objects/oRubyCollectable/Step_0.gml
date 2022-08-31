if (collected == true)
{
	visible = false;
}

if (instance_exists(obj_player) and collected == false)
{
	if (place_meeting(x, y, obj_player))
	{
		audio_play_sound(snd_gem, 1, false)
		obj_player.rubies++;
		collected = true;
	}
}

if (instance_exists(obj_player_boss) and collected == false)
{
	if (place_meeting(x, y, obj_player_boss))
	{
		audio_play_sound(snd_gem, 1, false)
		obj_player_boss.rubies++;
		collected = true;
	}
}

