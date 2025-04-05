var key_up = keyboard_check(ord("W"));
var key_down = keyboard_check(ord("S"));
var key_right = keyboard_check(ord("D"));
var key_left = keyboard_check(ord("A"));

//agarrar teclas e indicar velocidad horizontal y vertical
//horizontal

var hmove = key_right - key_left;
var vmove = key_down - key_up;

if hmove != 0 
{
	facing = hmove
}

if hmove != 0
	{
		if last_h != hmove
		{
			last_h = hmove;
			accel_final_h = 0;
		}
		if accel_final_h<= accel_max
		{
			accel_final_h += accel;
		}
	}
else
	{
		if accel_final_h > 0
		{
			accel_final_h -= accel;
		}
	}
if accel_final_h < accel
{
	accel_final_h = 0;
	last_h = 0;
}
hsp = accel_final_h * last_h;

//vertical
if vmove != 0
	{
		if last_v != vmove
		{
			last_v = vmove;
			accel_final_v = 0;
		}
		if accel_final_v<= accel_max
		{
			accel_final_v += accel;
		}
	}
else
	{
		if accel_final_v > 0
		{
			accel_final_v -= accel;
		}
	}
if accel_final_v < accel
{
	accel_final_v = 0;
	last_v = 0;
}
vsp = accel_final_v * last_v;

//diagonal
if hmove != 0 or vmove != 0
{
	//direccion a donde se está moviendo
	var dir = point_direction(0, 0, hmove, vmove);
	//distancia que se está moviendo
	hmove = lengthdir_x(accel_max, dir);
	vmove = lengthdir_y(accel_max, dir);
}

//COLISION><!!!!!!
//vertical
if (place_meeting(x + hsp, y, oBloque))
	{
		while(!place_meeting(x + sign(hsp), y, oBloque))
		{
			x = x + sign(hsp);
		}
	hmove = 0;
	}

//horizontal
if (place_meeting(x, y + vsp, oBloque))
	{
		while(!place_meeting(x, y + sign(vsp), oBloque))
		{
			y = y + sign(vsp);
		}
	vmove = 0;
	}

//ejecutar movimiento
x += hmove;
y += vmove;

//sprites
image_speed = 1;
//caminar
if hmove != 0 or vmove != 0
	{
		sprite_index = sJugadorCaminar;
	}
	//quieto
	else
	{
		sprite_index = sJugadorIdle;
	}
