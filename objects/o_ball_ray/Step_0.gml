var length_add = 16;

var nearest_body = instance_nearest(_xx, _yy, o_body);
if (instance_exists(o_body_temp))
{
	var nearest_temp_body = instance_nearest(_xx, _yy, o_body_temp);
	var d1 = point_distance(_xx, _yy, nearest_body.x, nearest_body.y);
	var d2 = point_distance(_xx, _yy, nearest_temp_body.x, nearest_temp_body.y);
	if (d2 < d1) nearest_body = instance_nearest(_xx, _yy, o_body_temp);
}

if (point_distance(_xx, _yy, nearest_body.x, nearest_body.y) < nearest_body.radius)
{
	collided = true;
}
else 
{
	length += length_add;
	collided = false;
}

_xx = ball.x + lengthdir_x(length, direc);
_yy = ball.y + lengthdir_y(length, direc);
