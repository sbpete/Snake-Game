calculate_depth();

draw_circle_color(x , y, radius, global.color2, global.color2, false);
draw_circle_color(x + lengthdir_x(z, global.cam_rotation - 90), 
				y - lengthdir_y(z, global.cam_rotation - 90), radius, global.color3, global.color3, false);
