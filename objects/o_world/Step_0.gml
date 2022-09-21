if (instance_number(o_ball) < ball_num)
{
	var _x = random(room_width);
	var _y = random(room_height);
	instance_create_layer(_x, _y, "Instances", o_ball);
}

if (instance_number(o_ball) < ball_num)
{
	var _x = random(room_width);
	var _y = random(room_height);
	if (point_distance(_x, _y, o_player.x, o_player.y) > 128) 
	{
		instance_create_layer(_x, _y, "Instances", o_coin);
	}
}
