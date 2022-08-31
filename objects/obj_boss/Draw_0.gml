if (got_hit)
{
	flash = true;
	hp -= 2;
	got_hit = false;
}

if (flash)
{
	if (flashTick >= 5)
	{
		flash = false;
		flashTick = 0;
	}
	shader_set(shWhite);
	flashTick++;
}

if (state == BossStates.jump and !instance_exists(obj_jump_indicator))
{
	instance_create_depth(x, y, depth, obj_jump_indicator);
}

draw_self();
shader_reset();