depth = o_player.depth - 64;
z = o_player.z;

// draw_eyes
var eye_length = 16;
var eye_spread = 24;

// left eye
draw_circle_color(o_player.x + lengthdir_x(z, global.cam_rotation - 90) + lengthdir_x(eye_length,  o_player.direction)
				+ lengthdir_x(eye_spread / 2,  o_player.direction + 90), 
				o_player.y - lengthdir_y(z, global.cam_rotation - 90)
				+ lengthdir_y(eye_length,  o_player.direction)
				+ lengthdir_y(eye_spread / 2,  o_player.direction + 90), 
				4, c_black, c_black, false);
// right eye
draw_circle_color(o_player.x + lengthdir_x(z, global.cam_rotation - 90) + lengthdir_x(eye_length,  o_player.direction)
				+ lengthdir_x(eye_spread / 2, o_player.direction - 90), 
				o_player.y - lengthdir_y(z, global.cam_rotation - 90)
				+ lengthdir_y(eye_length,  o_player.direction)
				+ lengthdir_y(eye_spread / 2,  o_player.direction - 90), 
				4, c_black, c_black, false);
