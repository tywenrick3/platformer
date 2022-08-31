/// SOURCE: https://www.youtube.com/watch?v=JGnZJh63BtM


for (var yy = 0; yy < yMax; yy++)
{
    
	for (var xx = 0; xx < xMax; xx++)
	{
	    draw_sprite_ext(spr, min(max(0, subImageIndex - xx), indexMax - 1), xx * sprW, yy * sprH, 1, 1, 0, color, 1);
	}
	
}