z = wave(8, 16, 2, 0);

calculate_depth();

draw_circle_color(x + lengthdir_x(z, global.cam_rotation - 90), 
							y - lengthdir_y(z, global.cam_rotation - 90), 
							radius, global.color5, global.color5, false);
