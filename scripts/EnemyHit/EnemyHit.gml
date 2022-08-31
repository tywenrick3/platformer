//Reference - //https://forum.yoyogames.com/index.php?threads/my-enemy-wont-die.51486/
//how to kill the enemies and allow hp to be decreased by getting hit by the player's attack
//function takes in number of hits to decrease HP
function EnemyHit(argument0) {
	var _damage = argument0;
	flash = true;
	
	hp -= _damage;
	if (hp > 0)
	{
		state = enemyState.Hit;
		hitNow = true;
	}
	else
	{
		state = enemyState.Dead;
	}

}
