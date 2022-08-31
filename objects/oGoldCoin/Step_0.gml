/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_player))
{
	if (place_meeting(x, y, obj_player))
	{
		obj_player.coins++;
		instance_destroy();
	}
}