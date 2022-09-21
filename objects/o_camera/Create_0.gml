/// @description set up camera
cam = view_camera[0];
global.cam_rotation = 0;
cam_rot_spd = 0;

follow = o_player;
view_w = camera_get_view_width(cam);
view_h = camera_get_view_height(cam);
view_w_half = view_w * .5;
view_h_half = view_h * .5;
xTo = xstart;
yTo = ystart;

buff = 0;

// display vars
window_scale = 1;
pixel_downscale = 2;

// extra stuff
shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;

// display_stuff
window_set_size(view_w*window_scale, view_h*window_scale);
surface_resize(application_surface, view_w/pixel_downscale, view_h/pixel_downscale);
