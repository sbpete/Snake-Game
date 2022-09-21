#region MOVEMENT

// shortcuts
mouse_left_down = mouse_check_button(mb_left);
mouse_right_down = mouse_check_button(mb_right);

// speed
var max_spd = 0;
var max_spd_cap = 15;
max_spd = (global.segment_amount + global.temp_segment_amount) * 0.1 + 4;
if (max_spd > max_spd_cap) max_spd = max_spd_cap;

var spd_increment = 0.1;

// movement
if (mouse_left_down) or (mouse_right_down)
{
	if (mouse_left_down) and (mouse_right_down) {}
	else
	{
		if (speed < max_spd) speed += spd_increment;
	}
	
}
else if (speed > 0)
{
	speed -= spd_increment;
}
if (mouse_left_down) and (mouse_right_down) and (speed > 0)
{
	speed -= spd_increment;
}

// sound
if (speed > 0)
{
	if (!audio_is_playing(sn_move)) audio_play_sound(sn_move, 300, true);
	audio_sound_gain(sn_move, speed / max_spd * 0.25, 0); 
}
else
{
	audio_stop_sound(sn_move);
}

// rotate camera
var dir_rot_spd_increment = 0.15;
var dir_rot_spd_max = 4;


if (mouse_left_down) and (dir_rot_spd > -dir_rot_spd_max) dir_rot_spd -= dir_rot_spd_increment;
if (mouse_right_down) and (dir_rot_spd < dir_rot_spd_max) dir_rot_spd += dir_rot_spd_increment;

if (!mouse_left_down) and (!mouse_right_down) dir_rot_spd += (0 - dir_rot_spd)/5;
if (mouse_left_down) and (mouse_right_down) dir_rot_spd += (0 - dir_rot_spd)/5;

direction -= dir_rot_spd;

#endregion

// coin pickup
coin_pickup();

// ball push
ball_push();

#region SEGMENTS

// add segment amount
if (add_seg_timer > 0) add_seg_timer--;
var add_seg_time = 1;
if (global.add_perm_segment > 0) and (add_seg_timer == 0)
{
	global.segment_amount++;
	global.add_perm_segment--;
	add_seg_timer = add_seg_time;
	
	if (global.segment_amount > 32)
	{
		with (o_camera)
		{
			/*// display_stuff
			pixel_downscale += 0.05;
		
			surface_resize(application_surface, view_w/round(pixel_downscale), view_h/round(pixel_downscale));*/
		}
	}
}

if (global.add_temp_segment)
{
	global.temp_segment_amount++;
	global.add_temp_segment = false;
}


// update permanent segments
var seg_length = array_length(global.segments);
if (seg_length < global.segment_amount)
{
	var new_segment = instance_create_layer(x, y, "Instances", o_body);
	global.segments[seg_length] = new_segment;
	
	with (new_segment)
	{
		segment_number = instance_number(o_body) + 1;
	}
	
	audio_play_sound(sn_grow, 400, false);
}

// update temporary segments
if (instance_number(o_body_temp) < global.temp_segment_amount)
{
	var new_temp_segment = instance_create_layer(x, y, "Instances", o_body_temp);
	global.temp_segments[instance_number(o_body_temp) - 1] = new_temp_segment;
}

// destroy segments
if (global.destroy_temp_body)
{
	global.temp_segment_amount = 1;
	with (o_body_temp) instance_destroy();
	for (var i = 0; i < array_length(global.temp_segments); i++)
	{
		with (global.temp_segments[i]) 
		{
			instance_destroy();
		}
		global.temp_segments[i] = noone;
	};
	
	with (o_arm_temp) instance_destroy();
	instance_create_layer(x, y, "Instances", o_arm_temp);
	
	global.destroy_temp_body = false;
}

#endregion

// see if segments looped
var loop_count = 0;
for (var i = 0; i < (array_length(global.segments) - 1); i++)
{
	if (global.segments[i].looped) loop_count++
}
for (var i = 0; i < (instance_number(o_body_temp) - 1); i++)
{
	if (global.temp_segments[i].looped) loop_count++
}
if (loop_count != 0)
{
	looped = true;
	color = c_red;
}
else 
{
	looped = false;
	color = global.color4;
}

// eyes
if (!instance_exists(o_eyes))
{
	instance_create_layer(x, y, "Instances", o_eyes);
}
