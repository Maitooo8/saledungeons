//set target values
var tx = x;
var ty = y;

//devolver a la posición anterior fuera de colisión
x = xprevious;
y = yprevious;

//conseguir distancia a donde quiere ir
var disx = abs(tx - x);
var disy = abs(ty - y);

//mover lo maximo posible en x y antes de chocar
repeat(disx)
{
	if !place_meeting(x + sign(tx - x), y, oBloque) x += sign(tx - x);
}

repeat(disy)
{
	if !place_meeting(x, y + sign(ty - y), oBloque) y += sign(ty - y);
}
