
//botao pressionado 
shootbutton = global.shootbutton;

//fade in
alpha += alphaSpeed;
alpha = clamp(alpha, 0 , 1);

//restart
if shootbutton && alpha >= 1
{
	room_restart();
	
}