
//Reference for the different player state scripts
// https://youtu.be/-0bckaBj__M -- State Machines
//https://forum.yoyogames.com/index.php?threads/state-machine.41371/

//This code organizes which state the player is in such as:
// Movement, jumping, speed state
//Attacking state

//this same process was applied to the enemy states as well

var grounded = tile_meeting(x, y + 1, "GroundTiles");

var left, right, jump, jump_held;
left = false;
right = false;
jump = false;
jump_held = false;
	

	// If the player is in the object that forces them to move to a direction, move to that direction

if (instance_nearest(x, y, obj_lead_player).go == true)
{
	switch(instance_nearest(x, y, obj_lead_player).orietation)
	{
		case("left"):
			left = true;
			break;
		case("right"):
			right = true;
			break;
		case("jump"):
			jump = true;
			jump_held = true;
			break;
	}
}


accel = right - left; // Tells what direction the player wants to go


hspd += accel; //Adds to the horizontal speed

if (grounded and hspd != 0) //only change to walking sprite if on the ground
{							
	sprite_index= sprWarriorRun;
}
	
if !(left or right)
{		
		//if not pressing either direction...
	if (grounded)
	{
		if (abs(hspd) > decel){
			hspd -= 1 * sign(hspd);	
		}
		else 
		{
			hspd = 0;
		}
	    sprite_index= spr_Warrior_Idle;				//..show idle animation!
	}
}

hspd = clamp(hspd, -hspd_max, hspd_max); // Speed can reach only a certain amount

if (accel != 0) image_xscale = accel; // Heads to the direction that the player is running to

do_collision(noone, "GroundTiles");

vspd += 0.4;