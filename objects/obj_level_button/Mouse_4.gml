if (instance_exists(obj_game_manager))
{

	if (obj_game_manager.levels_available[level] == true)
	{
		var _room;
		switch(level)
		{
			case(0):
				_room = rm_tutorial;
				break;
			case(1):
				_room = rm_level_1;
				break;
			case(2):
				_room = rm_level_2;
				break;
			case(3):
				_room = rm_boss_cut;
				break;
		}

		var fade = instance_create_depth(x, y, -1000, obj_transition);
		fade.targetRoom = _room;
	
	}

}