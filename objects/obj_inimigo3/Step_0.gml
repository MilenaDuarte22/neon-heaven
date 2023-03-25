// chama a funtion de dano
get_damaged(obj_damages);

#region // states do inimigo andar / atirar

switch(state){
	
	case 0:
	
		// segue o player
		if instance_exists(obj_player)
		{
		directE = point_direction(x,y, obj_player.x, obj_player.y);
	
		}
		speedE = speedCh;
		
		//pega as velocidades
		xspeedE = lengthdir_x(speedE, directE);
		yspeedE = lengthdir_y(speedE, directE);
		
		//moving 
		x += xspeedE;
		y += yspeedE;
		
		depth = -y - 50;
		
		//transição pra stado de atirar
		var _camLeft = camera_get_view_x(view_camera[0]);
		var _camRight = _camLeft + camera_get_view_width(view_camera[0]);
		var _camTop = camera_get_view_y(view_camera[0]);
		var _camBottom = _camTop + camera_get_view_height(view_camera[0]);
		
		//o timer so vai acrescentar se estiver na câmera 
		
		if bbox_right > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom
		{
			shootTimer++;
		}

		if shootTimer > cooldownTime
		{
			//vai para o estado de atirar 
			state = 1; 
			shootTimer = 0;
		}
		
	break;
	
	case 1: //pause e atira 
	
		if instance_exists(obj_player)
		{
		directE = point_direction(x,y, obj_player.x, obj_player.y);
		}
		speedE = 0;	
		
		
		//olha para o lado certo
		if directE > 90 && directE < 270
		{
			face = -1;	
		}
		else 
		{
			face= 1;
		}
		
		//shoot state
		shootTimer ++;
		//cria a bullet 
		if shootTimer == 1
		{
			bulletInst = instance_create_depth(x + bulletXoff * face, y + bulletYoff, depth, obj_bigesfere);
		}
		//mantem a bala na mão do inimigo 
		if shootTimer <= windUpTimer && instance_exists(bulletInst)
		{
			bulletInst.x = x + bulletXoff * face;
			bulletInst.y = y + bulletYoff;
		}
		//atira apos a janela de tempo acabar 
		
		if shootTimer == windUpTimer && instance_exists(bulletInst)
		{
			//da ao state 1, move state 
			bulletInst.state = 1;
		}
		//recover e volra a seguir o player 
		
		if shootTimer > windUpTimer + recoverTimer
		{
			//volta ao state 0 - seguir o player 
			state = 0;
			shootTimer = 0; //evita que o inimigo fique seguindo e atirando 
		}
break;
}

#endregion

//Collision
	
if place_meeting( x + xspeedE, y , obj_parede) || place_meeting(x + xspeedE , y , obj_inimigo1)
{
	xspeedE = 0;
}

if place_meeting( x,  y +yspeedE, obj_parede)  ||  place_meeting(x , y + yspeedE  , obj_inimigo1)
{
	yspeedE = 0;
}
	
//morte


if hp<= 0
{
	instance_destroy();
}
