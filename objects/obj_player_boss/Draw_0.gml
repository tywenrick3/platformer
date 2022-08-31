

if (state == playerStates.swing)
{
	draw_line_width(grappleX, grappleY, ropeX - (((sprite_xoffset * -1) / 2) ), ropeY - sprite_yoffset / 2,2);
}

draw_self();

//draw_rectangle(
//	bbox_left,
//	bbox_top,
//	bbox_right,
//	bbox_bottom,
//	true
//);