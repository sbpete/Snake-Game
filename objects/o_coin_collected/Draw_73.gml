calculate_depth();

// increment vars
a -= 0.05
radius++;
z++;

// draw
if (a <= 0) instance_destroy();

draw_set_alpha(a)
draw_circle_color(x + lengthdir_x(z, global.cam_rotation - 90), 
							y - lengthdir_y(z, global.cam_rotation - 90), 
							radius, global.color5, global.color5, false);
							
draw_set_alpha(1);
