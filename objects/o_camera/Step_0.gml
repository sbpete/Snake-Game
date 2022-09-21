if !window_get_fullscreen()
{
    window_center();
}

// update destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

// update object position
x += (xTo - x) / 10;
y += (yTo - y) / 10;

// clamp cam to sides of room
x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);

// screen shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

// update camera view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

// shortcuts
mouse_left_down = mouse_check_button(mb_left);
mouse_right_down = mouse_check_button(mb_right);

camera_set_view_angle(cam, global.cam_rotation);

// rotate camera
var cam_rot_spd_increment = 0.01;
var cam_rot_spd_max = 1;

if (abs(cam_rot_spd) < cam_rot_spd_max)
{
	if (mouse_left_down) cam_rot_spd -= cam_rot_spd_increment;
	if (mouse_right_down) cam_rot_spd += cam_rot_spd_increment;
}
if (!mouse_left_down) and (!mouse_right_down) cam_rot_spd += (0 - cam_rot_spd)/25;
if (mouse_left_down) and (mouse_right_down) cam_rot_spd += (0 - cam_rot_spd)/25;

global.cam_rotation += cam_rot_spd;
