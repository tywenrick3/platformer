draw_self()

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text(x, y, level);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

if (instance_exists(obj_game_manager))
{

	if (obj_game_manager.current_level == level)
	{
		draw_sprite(spr_player_in, 0, x, y)
	}

}