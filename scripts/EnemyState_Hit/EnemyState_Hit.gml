
//what happens when they get hit by the player
function EnemyState_Hit() {
	//Just hit
	if (hitNow)
	{
		//change sprite to damaged animation
		sprite_index = spr_skelly_hit
		image_index = 0;
		hitNow = false;
		frameCount = 0;
	}
	
	//reset enemy state back to normal after gettting hit
	frameCount++;
	if (frameCount > 20) 
	{
		frameCount = 0;	
		state = enemyState.Free;
	}


}
