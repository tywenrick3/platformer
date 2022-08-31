sprite_index = spr_boss_attack;
image_speed = 1;

hp = 50;

flashTick = 0;

played = false;

got_hit = false;

specialReady = false;
hspd = 0;
vspd = 0;
spd = 2;

tick = 0;
attackCooldown = 120;
colTick = 0;
sprintTo = 0;

//Jump attack
flash = false;
prepareJumpTick = 0;


specialAttack = 0;

enum BossStates
{
	idle,
	special,
	attack,
	dead,
	jump
}



state = BossStates.idle;


grounded = tile_meeting(x, y + 1, "GroundTiles")
xScaleStart = image_xscale;