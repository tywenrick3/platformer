/// SOURCE: https://www.youtube.com/watch?v=JGnZJh63BtM


switch(state)
{
	case(states.OUT):
		if (subImageIndex < indexMax + xMax)
		{
			subImageIndex += subImageIncrement;
		}
		else
		{
			state = states.IN;
			if (room_exists(targetRoom)) room_goto(targetRoom);
		}
	
		break;
	
	case(states.IN):
		
		if (subImageIndex > 0)
		{
			subImageIndex -= subImageIncrement;
		}
		else
		{
			instance_destroy();	
		}
	
		break;
	
}

