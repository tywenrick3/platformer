//se o jogador não existir, camera deve parar ate que ele volte a vida.
	
// Update zoom size
///Zoom level variable controls zoom


// Update view size
zoomXTo = cam_default_w * zoomLevel;
zoomYTo = cam_default_h * zoomLevel;
temp_cam_w += (zoomXTo - camera_get_view_width(cam)) / 25;
temp_cam_h += (zoomYTo - camera_get_view_height(cam)) / 25;
var temp_cam_w_half = temp_cam_w/2;
var temp_cam_h_half = temp_cam_h/2;
camera_set_view_size(cam, temp_cam_w, temp_cam_h);


// Update object position
if (instance_exists(follow)) {
	var xTo = follow.x;
	var yTo = follow.y;

//Move camera


x += (xTo - x) / 5;
y += (yTo - y) / 5;
	
x = clamp(x, temp_cam_w_half+buff, room_width-temp_cam_w_half-buff);
y = clamp(y, temp_cam_h_half+buff, room_height-temp_cam_h_half-buff);


cam_x += random_range(-shake_remain, shake_remain);
cam_y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));


// Update camera view

camera_set_view_pos(cam, x-temp_cam_w_half, y-temp_cam_h_half);

}

if (obj_boss.grounded == true)
{
	zoomLevel = 1.4;
}
else if (obj_boss.state == BossStates.special)
{
	zoomLevel = 1.8;
}