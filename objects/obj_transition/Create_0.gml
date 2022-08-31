/// SOURCE: https://www.youtube.com/watch?v=JGnZJh63BtM

enum states
{
	OUT,
	IN
}

state = states.OUT;

spr = sTransitionSquare;
sprW = sprite_get_width(spr);
sprH = sprite_get_height(spr);


xMax = display_get_gui_width() div sprW + 1;
yMax = display_get_gui_height() div sprH + 1;
indexMax = sprite_get_number(spr);

//Sprite speed
subImageIncrement = sprite_get_speed(spr) / room_speed;
subImageIndex = 0;

color = c_black;

targetRoom = noone;