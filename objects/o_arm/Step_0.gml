arm_set_length(global.segment_amount * global.segment_length, global.segment_amount);

var array_len = array_length(global.segments);
if (array_len > 0) arm_move_to(o_player.x, o_player.y);
