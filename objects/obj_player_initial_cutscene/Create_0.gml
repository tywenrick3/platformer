 // Change these variables to make your own game feel! 
// You may also add your own functionality.

//how many steps the player made on the ground
step_count = 0;

//if currently on the wall 
onWall = 0;

//particles on the wall for player
dust = 0;

//max speed
hspd_max = 6

//horizontal speed wall jump
hspd_wjump = 4;

//vertical speed wall jump
vspd_wjump = -9;
//max wall jump
vspd_max_wall = 15;
//max vertical speed
vspd_max = 10;

//speed up, slow down
accel = 1               
decel = .5

//jump stuff
jump_max= 6
grav_amt= 0.5

//wall jump stuff
walljumpdelay = 0;
//to get momentum, 17 frames after the wall jump happens, theres no control over the left or right movement,
//so the game will just carry the player for 17 frames
walljumpdelay_max = 17;

//gravity on the wall
grav_wall = 0.1;


//coyote time
canJump = 10;

#region 

hspd = 0
vspd = 0
grounded=false
jumps_spent = 0
x_remainder = 0;
y_remainder = 0;
image_speed=1
#endregion

xscale_dir = image_xscale;