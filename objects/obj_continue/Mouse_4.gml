if (file_exists("save_levels.sav"))
{
	var fade = instance_create_depth(x, y, -1000, obj_transition);
	fade.targetRoom = rm_level_selection;
}