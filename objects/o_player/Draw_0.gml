player_calculate_depth();

// draw player
draw_circle_color(x + lengthdir_x(z, global.cam_rotation - 90), 
				y - lengthdir_y(z, global.cam_rotation - 90), radius, color, color, false);
