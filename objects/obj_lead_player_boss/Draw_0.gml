if ((place_meeting(x, y, obj_player) or place_meeting(x, y, obj_player_boss)) and (next_room != noone))
{
	
	if (tick >= wait_after_seconds * 60)
	{
		go = true;
		global.checkpoint = noone;
		var fade = instance_create_depth(x, y, -1000, obj_transition);	
		fade.state = states.OUT;
		fade.targetRoom = next_room;
	}
	
}