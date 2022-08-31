if (file_exists("save_levels.sav"))
{	
	instance_destroy(obj_game_manager);
	file_delete("save_levels.sav");	
	instance_create_depth(x, y, depth, obj_game_manager);
}

var fade = instance_create_depth(x, y, -1000, obj_transition);
fade.targetRoom = rm_initial_cutscene;