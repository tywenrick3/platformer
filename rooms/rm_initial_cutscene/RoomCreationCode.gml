draw_set_font(fntRenogare);

if !(file_exists("save_levels.sav"))
{
	instance_create_depth(0, 0, 0, obj_game_manager)
}