xTo = obj_boss.x;
x += (xTo - x) / 3;

if (tick <= 120)
{
	visible = true;
}
else if tick <= 240
{
	visible = false;
}
else
{
	tick = 0;
}

if (obj_boss.grounded)
{
	instance_destroy();
}

tick += increaseTick;
increaseTick += 0.4;