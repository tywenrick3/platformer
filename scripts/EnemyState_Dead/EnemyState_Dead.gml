//simply changing sprites here
function EnemyState_Dead() {
	if (sprite_index != spr_skelly_dead)
	{
		sprite_index = spr_skelly_dead;
		image_index = 0;
	}

	if (animation_end())  {
		instance_change(oCorpse,true);
	}
}
