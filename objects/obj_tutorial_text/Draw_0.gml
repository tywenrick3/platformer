if (place_meeting(x, y, obj_player))
{
	
	// If the player is colliding here, it will make a text animation
	
	
	yy += (baseValue - 100 - yy) / 10;
	
	//yy = lerp(yy, y, room_speed);;
	
	if (text_alpha < 1)
	{
		text_alpha += 0.1;
	}
}
else
{
	// Undo the animation if the player isn't colliding anymore
	
	//yy = lerp(yy, y + 100, room_speed);;
	
	
	yy += (baseValue - yy) / 10;
		
	
	if (text_alpha > 0)
	{
		text_alpha -= 0.1;
	}
}

draw_set_alpha(text_alpha);
draw_text(xx, yy, msg);
draw_set_alpha(1);
