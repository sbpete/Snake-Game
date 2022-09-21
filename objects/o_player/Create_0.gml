debug = false;
color = global.color4;

// drawing
radius = 32;

// player vars
global.player_z = 8;
z = 0;

dir_rot_spd = 0;

// segment vars
looped = false;
global.destroy_temp_body = false;

global.segment_length = 8;

global.segments = [];
global.segment_amount = 1;

global.temp_segments[100] = noone;
global.temp_segment_amount = 1;

add_seg_timer = 1;
global.add_perm_segment = 0;
global.add_temp_segment = false;

// create parts
alarm[0] = 10;

instance_create_layer(x, y, "Instances", o_arm);
instance_create_layer(x, y, "Instances", o_arm_temp);
instance_create_layer(x, y, "Instances", o_eyes);
