arm_set_length(instance_number(o_body_temp) * global.segment_length,instance_number(o_body_temp));

var array_len = array_length(global.segments);
if (array_len > 0) arm_move_to(global.segments[0].x, global.segments[0].y);
