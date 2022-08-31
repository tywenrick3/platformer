// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function do_collision(object, tileset){

//decimal fractions of hsp are stored in hsp_f
//every frame this fraction is added back in and the new fraction removed again
//this moves us in whole integers each frame that are still representative of decimal movement
//for example, at a hsp of 0.1 you would move 1 pixel every 10 frames.
//this resolves any issues of not detecting a collision at a fractional target (ie: no collision at 3.8, when there is at 4.0)
//which sometimes caused the player after rounding, to be drawn overlapping walls by 1 pixel.
 
hsp_final = hspd;
hsp_f = hsp_final - floor(abs(hsp_final))*sign(hsp_final);
hsp_final -= hsp_f;

vsp_final = vspd;
vsp_f = vsp_final - floor(abs(vsp_final))*sign(vsp_final);
vsp_final -= vsp_f;
 
//same old tile_meeting collision code.
if (tile_meeting(x+hsp_final,y,tileset)) // Tile
{
    var inc = sign(hsp_final);
    while (!tile_meeting(x+inc,y,tileset)) x+= inc;
    hsp_final = 0;
    hspd = 0;
	
	if (object_index == obj_player or object_index == obj_player_boss) and (state == playerStates.swing)
	{
		ropeAngle = point_direction(grappleX, grappleY, x, y);
		ropeAngleVelocity = 0;
	}
}

if (place_meeting(x+hsp_final,y,object)) // Object
{
    var inc = sign(hsp_final);
    while (!place_meeting(x+inc,y,object)) x+= inc;
    hsp_final = 0;
    hspd = 0;
	
	if (object_index == obj_player or object_index == obj_player_boss) and (state == playerStates.swing)
	{
		ropeAngle = point_direction(grappleX, grappleY, x, y);
		ropeAngleVelocity = 0;
	}
}

x+=hsp_final;
 
 
 if (place_meeting(x,y+vsp_final,object)) // Object
{
    var inc = sign(vsp_final);
    while (!place_meeting(x,y+inc,object)) y+= inc;
    vsp_final = 0;
    vspd = 0;
	
	if (object_index == obj_player or object_index == obj_player_boss) and (state == playerStates.swing)
	{
		ropeAngle = point_direction(grappleX, grappleY, x, y);
		ropeAngleVelocity = 0;
	}
	
}

 
if (tile_meeting(x,y+vsp_final,tileset)) // Tile
{
    var inc = sign(vsp_final);
    while (!tile_meeting(x,y+inc,tileset)) y+= inc;
    vsp_final = 0;
    vspd = 0;
	
	if (object_index == obj_player or object_index == obj_player_boss) and (state == playerStates.swing)
	{
		ropeAngle = point_direction(grappleX, grappleY, x, y);
		ropeAngleVelocity = 0;
	}
}


y+=vsp_final;


}