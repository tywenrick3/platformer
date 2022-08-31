if (place_meeting(x, y, obj_player) or place_meeting(x, y, obj_player_boss) or place_meeting(x, y, obj_player_initial_cutscene))
{
	if (tick >= wait_after_seconds * 60)
	{
		go = true;
	}
	else
	{
		tick++;
	}
}

if instance_exists(obj_player)
{
	points = obj_player.rubies * 1000;
}

show_debug_message(go);