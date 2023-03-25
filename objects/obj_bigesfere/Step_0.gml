///state machine

switch(state)
{
	//espera o inimogo atirar - pegando a direção
	case 0:
		if instance_exists(obj_player)
		{
			directE = point_direction(x, y, obj_player.x, obj_player.y);
		}
	//profundidade para o inimigo ficar atras
	depth = - y -50;

	break;
	
	//shoot - trajetoria da bala 
	case 1:
		xspeed = lengthdir_x(speedE, directE);
		yspeed = lengthdir_y(speedE, directE);
		
		x += xspeed;
		y += yspeed;
		
		depth = -y;
		
	break;
	
}	

//cleanup - destroy check
var _pad = 16;
if bbox_right < -_pad || bbox_left > room_width + _pad || bbox_bottom < -_pad || bbox_top > room_height + _pad
{
	destroy = true;
}

if hitConfirm == true && playerDestroy == true 
{
	destroy = true;
}

if destroy == true 
{
	instance_destroy();
}

if place_meeting(x , y, obj_parede_solida)
{
	destroy = true;
}

