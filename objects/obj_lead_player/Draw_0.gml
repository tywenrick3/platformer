
if !(end_level)
{
	if ((place_meeting(x, y, obj_player) or place_meeting(x, y, obj_player_boss) or place_meeting(x, y, obj_player_initial_cutscene)) and (next_room != noone))
	{
		global.checkpoint = noone;
		var fade = instance_create_depth(x, y, -1000, obj_transition);	
		fade.state = states.OUT;
		fade.targetRoom = next_room;
	}
}