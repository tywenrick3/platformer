
function PlayerSTATE_Free() {

#region base movement and animation related to keypress

if !(place_meeting(x, y, obj_lead_player) or place_meeting(x, y, obj_lead_player_boss))
{
	var left = keyboard_check(ord("A"))
	var right = keyboard_check(ord("D"))
	var jump = keyboard_check_pressed(vk_space);
	var jump_held = keyboard_check(vk_space);
}
else
{
	var left, right, jump, jump_held;
	left = false;
	right = false;
	jump = false;
	jump_held = false;
	
	// If the player is in the object that forces them to move to a direction, move to that direction
	if instance_exists(obj_lead_player)
	{
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
	}
}




//Getting attacked
if ((place_meeting(x, y, pEnemy) or place_meeting(x, y, oAxeEnemyHurt)) && invencibility <= 0)
{
	if (instance_nearest(x, y, pEnemy).state != enemyState.Dead)
	{
		if (rubies != 0)
		{
			state = playerStates.hurt;
		}
		else
		{
			state = playerStates.dead;
		}
	}
}
invencibility--; // Decreases the invencibility time per frame

//Movement
//walljumpdelay will be equal to itself decremented by 1 for each frame until it hits zero
//so when wall jumping to the right wall for example, you can hold the right movement key down,
//and you will just sldie down smoothly
//while on the wall and you press jump, you will be leaped forward until youre allowed to move back
//or if you jump from the wall and dont press anything, its just a simple smooth return
walljumpdelay = max(walljumpdelay - 1,0);
//player wont be able to move left and right if walljumpdelay != 0. Since at that time, we are not wall jumping
	


accel = right - left; // Tells what direction the player wants to go

if (walljumpdelay == 0) 
{
	hspd += accel; //Adds to the horizontal speed

	if (grounded and hspd != 0) //only change to walking sprite if on the ground
	{							
		sprite_index= sprWarriorRun;
	}
	
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
	
//reference for wall jump - https://forum.yoyogames.com/index.php?threads/noob-problems-platformers-and-wall-jumping-solved.35690/
//2nd reference - https://forum.yoyogames.com/index.php?threads/wall-jumping.1177/
	
	
//jumping off the wall
//if we are on the walll from the left or right, and not on the ground, and have pressed the jump key,
//horizontal speed will be set to a negative number or positive number depends on which side.
if (onWall != 0) and (!grounded) and (jump) 
{
	walljumpdelay = walljumpdelay_max;
	audio_play_sound(snd_jump, 1, false)
	//negative or postive hortizontal direction on the wall
	hspd = -onWall * hspd_wjump;
	//gives a higher jump when jumping off the wall
	vspd = vspd_wjump;
}

//vertical move for wall jump
//this temp variable determines what the gravity will finally end up being at that given moment
var grav_final = grav_amt;
//same thing with the vertical speed
var vspd_max_final = vspd_max;
//if not on wall and currently in the air...
if (onWall != 0) and (vspd > 0) {
	//we move down or descend slower
	grav_final = grav_wall;
	vspd_max_final = vspd_max_wall;
}
//then we increment the final gravity in the moment instead of the overall gravity amount
vspd += grav_final;  
//make sure the player does not go over the max vertical speed in any direction
vspd = clamp(vspd, -vspd_max_final, vspd_max_final);

#endregion

#region jumping and falling



canJump--; // Coyote time. If the player isn't on ground, decrease it by one every frame.
if (grounded) // If the variable reaches 0, you won't be able to jump anymore. 
{
	canJump = 10;
}

if (canJump > 0 && jump)
{
	audio_play_sound(snd_jump, 1, false)
	vspd = -10;
	canJump = 0;
}

if(vspd < 0 && !jump_held)
{ 
	vspd = lerp(vspd,0,0.2)
}


if (vspd > 1) // Changes between falling and jumping sprites
{
	sprite_index= spr_warrior_fall
}
else if (vspd < -1)
{
	sprite_index= spr_warrior_jump
	
	
}

#endregion


#region movement and collisions
	
//are we on the ground?
if(place_meeting(x, y+1, obj_platform) or tile_meeting(x, y + 1, "GroundTiles")){

	grounded = true
	jumps_spent = 0
		
	//Can't figure out how to get the commented out code below to run,
	//so the player can be carried by a moving platform, 
	//instead of having to use the movment keys,
	//to keep the player stationed on the moving platform
		
	//var instance = instance_place(x, y + 1, obj_platform);
	//if (instance != noone) {
	//	is_on_platform = true;
	//	hspd = (instance.hspd + decel) * instance.dir; // error happens here...?
	//} else {
	//	is_on_platform = false;
	//}
	
	//if the vertical speed while the player is in the air is greater than 7, 
	//when the player lands,
	//a dust effect will happen
	//so in other words, if the player is falling from a high distance, 
	// dust will appear to show that the player made a landing
	if(floor(vspd) > 7) {
		//this is repeated 70 times, so 70 dust particles will be made
		repeat(70) {
			
			var xx = x + random_range(-16, 16);
			var yy = (y + sprite_yoffset / 2) + random_range(12, 18);
			
			var obj_dusteffects = instance_create_layer(xx, yy, "DustEffects", obj_dust)
			obj_dusteffects.add_movement = true;
			obj_dusteffects.delay = 0;
		}
	}
} else {
	grounded = false
}

if (hspd != 0) {
	//if on ground, increment the steps on the player moving
	if (grounded = true) {
		
		step_count += 1;
		//set a max step count so the number does not too high in an endless loop
		if(step_count > 60) {
			step_count = 0;
		}
		//the modulus is used to create a more realistic dust effect
		//so every two steps, the dust effect happens
		if(step_count mod 3 == 0) {
			//juice effect #2
			instance_create_layer(x, (y - 12) + random_range(50, 56), "DustEffects", obj_dust);
		}
	}
}

#endregion


#region Jumping on Wall with Dust

//calculate current status, check if we're on the wall
onWall = tile_meeting(x+1, y, "GroundTiles") - tile_meeting(x-1, y, "GroundTiles");

if(!grounded) {
	if(onWall != 0) and !(tile_meeting(x, y + 22, "GroundTiles")) {
		sprite_index = spr_Warrior_Wall;
		xscale_dir = onWall;
		
		//dust appearance
		//grabs the left of the sprite
		var side = bbox_left;
		//grabs the right of the sprtie and increment dust
		if (onWall == 1) side = bbox_right;
			dust++;
		// juice effect #1
		//once every three frames that we're on the wall, this if statement will run and create dust that descends
		if ((dust > 2) and (vspd > 0)) with (instance_create_layer(side, bbox_top, "DustEffects", oDust)) {
			other.dust = 0;	
			//allows the dust to come off away from the wall
			hspeed = -other.onWall * 0.5;
		}
	}
	else {
		dust = 0;
	}
}


#endregion

#region Grappling Hook
//reference for gappling hook idea - https://www.youtube.com/watch?v=LyhzdCHeE-k&t=298s

//CHECKING HOOK
if(mouse_check_button_pressed(mb_right)) 
{
	
	grappleX = mouse_x;
	grappleY = mouse_y;
		
	if place_meeting(grappleX, grappleY, obj_platform)
	{
		ropeX = x;
		ropeY = y;
		ropeAngleVelocity = 0;
		ropeAngle = point_direction(grappleX, grappleY, ropeX, ropeY);
		ropeLength = point_distance(grappleX, grappleY, ropeX, ropeY);
		audio_play_sound(snd_grapple_gun, 1, false);
		state = playerStates.swing;
	}
	else
	{
		var checkPlatform = collision_line(x, y, grappleX, grappleY, obj_platform, false, true)
	
		if (checkPlatform != noone)
		{
			grappleX = checkPlatform.x;
			grappleY = checkPlatform.y;
			
			
			ropeX = x;
			ropeY = y;
			ropeAngleVelocity = 0;
			ropeAngle = point_direction(grappleX, grappleY, ropeX, ropeY);
			ropeLength = point_distance(grappleX, grappleY, ropeX, ropeY);
			state = playerStates.swing;
		}
	}
}

#endregion


//MoveCollide() // < - wow, big script!
do_collision(obj_collidable, "GroundTiles");


//Attack
if (mouse_check_button_pressed(mb_left)) {
	image_index = 0;
	audio_play_sound(snd_sword_swing, 1, false)
	if (grounded) 
	{
		
		state = global.ATTACKSLASH;
	}
	else
	{
		
		state = playerStates.airattack;
	}
}

}