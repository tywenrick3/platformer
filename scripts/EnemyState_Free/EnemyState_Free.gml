//idle animation 

function EnemyState_Free() {
	sprite_index = spr_skelly_idle;
	dist = point_distance(oAxeEnemy.x, oAxeEnemy.y, obj_player.x, obj_player.y);
	
	if (dist < 100){
		sprite_index = spr_skelly_attack;
		image_index = 0;
	}
	
	if(place_meeting(x, y+1, obj_platform) or tile_meeting(x, y + 1, "GroundTiles")){

	grounded = true
	jumps_spent = 0
		
	
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

}
