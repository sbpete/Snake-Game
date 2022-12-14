/// @desc initialize arm object by specifying segment lengths
/// @func arm_initialize_seg(segments, seg_length);
/// @arg segments		the amount of segments that the arm will have (idividual lines)
/// @arg seg_length		the length to assign each individual segment
function arm_initialize_seg() {

	/////////////////////////////////////////////////////////////////
	//////////  Important! Must be ran in all arm objects  //////////
	/////////////////////////////////////////////////////////////////

	var tony_sprite = image_index, tony_setspr = true;
	if (argument_count > 2) {
		tony_sprite = argument[2];
	}


	seg_amount				= floor(argument[0]);
	var tony_default_length = floor(argument[1]);

	seg_x	= [];
	seg_y	= [];
	seg_len = [];
	seg_spr = [];

	arm_length	= tony_default_length*seg_amount;
	arm_pinned	= false;


	if (is_array(tony_sprite)) {
		seg_spr = tony_sprite;
		tony_setspr = false;
	}


	for (var tony_i = 0; tony_i <= seg_amount; tony_i++) {
	
		seg_x[tony_i]	= x + tony_i * tony_default_length;
		seg_y[tony_i]	= y;
		seg_len[tony_i]	= tony_default_length;
	
		if (tony_setspr) seg_spr[tony_i] = tony_sprite;
	}


	return arm_length;


}
