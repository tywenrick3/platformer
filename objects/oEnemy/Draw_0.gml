if (flash)
{
	if (image_index >= 2) flash = false;
	shader_set(shWhite);
}

draw_self();
shader_reset();