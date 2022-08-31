

if (state == playerStates.dead) //Makes the animation for the game over screen
{
	gameOverTick += 0.05;
	 
	 draw_set_halign(fa_center);
	 draw_set_valign(fa_middle);
	 
	//// Draws the black background
	draw_set_color(c_black);
	draw_set_alpha(clamp(gameOverTick, 0, 0.7));
	draw_rectangle(0, 0, window_get_width(), window_get_height(), false);
	draw_set_color(c_white);
	////
	
	//// Draws the GameOver text
	draw_set_font(fntRenogareBig);
	draw_set_alpha(gameOverTick - 1);
	draw_text(display_get_width() / 3, display_get_height() / 3, "Game Over");
	////		
	

	
	//// Draws the command to retry
	draw_set_font(fntRenogare);
	draw_set_alpha(gameOverTick - 5);
	draw_text(display_get_width() / 3, display_get_height() / 3 + 50, "Press R to try again");
	////
	
	if (keyboard_check(ord("R")))
	{
		var fade = instance_create_depth(x, y, -1000, obj_transition);
		fade.targetRoom = room;
	}
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	draw_set_alpha(1);
}
else
{
	draw_sprite_ext(spr_ruby, rubyTick, 60, 60, 4, 4, 0, c_white, 1);
	draw_set_font(fntRenogareBig);
	if (ended == false) draw_text(display_get_gui_width() - 250, 30, "Time: " + string(minutes) + ":" + string(seconds))
	draw_text(90, 60, "x " + string(rubies));
	draw_set_font(fntRenogare);
	rubyTick += 0.5;
}