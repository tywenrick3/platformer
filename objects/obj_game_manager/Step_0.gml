if !(timeStop)
{
	timeTick++
	if (timeTick >= 60)
	{
		timeTick = 0;
		seconds++;
	
		if (seconds >= 60)
		{
			minutes++;
			seconds = 0;
		}
	}
}


switch(room)
{
	
	case(rm_tutorial):
		levels_available[0] = true;
		current_level = 0;
		break;
	case(rm_level_1):
		levels_available[1] = true;
		current_level = 1;
		break;
	case(rm_level_2):
		levels_available[2] = true;
		current_level = 2;
		break;
	case(rm_boss_cut):
		levels_available[3] = true;
		current_level = 3;
		break;
}

show_debug_message(levels_available)

//if !(room == rm_level_selection) 
save_levels();