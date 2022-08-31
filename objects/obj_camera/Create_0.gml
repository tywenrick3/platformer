
spd = 0.225;

cam = view_camera[0];
cam_default_w = camera_get_view_width(cam);
cam_default_h = camera_get_view_height(cam);
follow = obj_player;

view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

xTo = xstart;
yTo = ystart;

width_ = camera_get_view_width(view_camera[0]);
height_ = camera_get_view_height(view_camera[0]);
scale_ = width_ / view_get_wport(0);

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;

buff = 13;

cam_x = 0;
cam_y = 0;



// Zooming
zoomLevel = 1;
temp_cam_w = cam_default_w;
temp_cam_h = cam_default_h;

