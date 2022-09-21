// vars
platform_num = 25;
ball_num = 250;
coin_num = 750;

// spawning
randomize();

var i = 0;
while (i < platform_num)
{
	var _x = random(room_width);
	var _y = random(room_height);
	var platform = instance_create_layer(_x, _y, "Instances", o_platform);
	with (platform)
	{
		radius = random_range(64, 128);
		z = random_range(16, 32);
	}
	i++;
}

i = 0;
while (i < ball_num)
{
	var _x = random(room_width);
	var _y = random(room_height);
	instance_create_layer(_x, _y, "Instances", o_ball);
	i++;
}

i = 0;
while (i < coin_num)
{
	var _x = random(room_width);
	var _y = random(room_height);
	if (point_distance(_x, _y, o_player.x, o_player.y) > 128) 
	{
		instance_create_layer(_x, _y, "Instances", o_coin);
		i++;
	}
}
