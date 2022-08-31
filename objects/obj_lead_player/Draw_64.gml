if (place_meeting(x, y, obj_player) or activated)
{
	activated = true;
	draw_level_end_tick++
}

draw_set_halign(fa_center)
draw_set_valign(fa_middle);
if (end_level == true and activated)
{
	obj_player.ended = true;
	obj_camera.follow = noone;
	obj_game_manager.timeStop = true;
	if (seconds == 0) seconds = obj_player.seconds;
	if (minutes == 0) minutes = obj_player.minutes;
	
	var totalSeconds = (seconds + (minutes / 60))
	
	draw_set_font(fntRenogareBig)
	if (draw_level_end_tick > 0)
	{
		draw_text(display_get_gui_width() / 2, display_get_gui_height() / 4, "Score: " + string(points - (totalSeconds * 10)))
	}

	if (draw_level_end_tick > 60)
	{
		draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2, "Rubies collected: " + string(obj_player.rubies))
	}

	if (draw_level_end_tick > 120)
	{
		draw_text(display_get_gui_width() / 2, display_get_gui_height() / 1 - 300, "Time taken: " + string(minutes) + ":" + string(seconds));
	}
	draw_set_font(fntRenogare)
	
	if (draw_level_end_tick > 240)
	{
		global.checkpoint = noone;
		var fade = instance_create_depth(x, y, -1000, obj_transition);	
		fade.state = states.OUT;
		fade.targetRoom = next_room;
	}

}
draw_set_halign(fa_left)
draw_set_valign(fa_top);
