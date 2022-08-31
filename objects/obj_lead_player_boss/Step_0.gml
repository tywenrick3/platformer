if (place_meeting(x, y, obj_player) or place_meeting(x, y, obj_player_boss))
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

show_debug_message(go);