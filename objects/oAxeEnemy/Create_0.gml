

hitNow = false;
frameCount = 0;
flash = false;
hp = 8;

hspd = 0
vspd = 0;

played = false

enum enemyState
{
	Free,
	Hit,
	Dead,
	Attack
}


//current state for enemy
state = enemyState.Free;

image_index = irandom(10);

