var middle = display_get_gui_width() / 2;

if (hp >= -50)
{
	draw_set_color(c_gray);
	draw_rectangle(middle - 50 * 5, 50, middle + 50 * 5, 70, false);
	draw_set_color(c_green);
	draw_rectangle(middle - 50 * 5, 50, middle + hp * 5, 70, false);
	draw_text(0, 0, hp)
}

draw_set_color(c_white);