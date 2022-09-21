// gravity
/*if (jump) z++;
if (!jump) and (z > 8) z -= 2;
if (z < 8) z = 8;*/

// friction
if (speed > 0) speed -= 0.1;

// bounce off walls
bounce_off(o_platform);

// bounce off snake
bounce_off(o_body);

if (instance_exists(o_body_temp))
{
	bounce_off(o_body_temp);
}

if (o_player.looped) and (!player_looped) and (distance_to_object(o_player) < 500) // maybe change*
{
	var ray_count = 4;
	var add_angle = 360 / ray_count;
	var dir = 0;
	
	for(var rays = 1; rays <= ray_count; rays ++)
	{
		var ray_obj = instance_create_layer(x, y, "Instances", o_ball_ray);
		ray_id[rays - 1] = ray_obj;
		with (ray_obj)
		{
			direc = dir;
			ball = other.id;
	
			other.ray_id[rays] = id;
		}
		
		dir = (add_angle * rays);
	}
	
	player_looped = true;
	
}
if (o_player.looped) and (player_looped)
{
	if (ray_id[0].collided) and (ray_id[1].collided) and (ray_id[2].collided) and (ray_id[3].collided)
	{
		ball_looped();
	}
}
if (!o_player.looped) and (player_looped) // reset stuff
{
	var i = 0;
	repeat (4)
	{
		with (ray_id[i]) instance_destroy();
		ray_id[i] = noone;
		i++;
	}
	player_looped = false;
}
