var _getDamage = true;
get_damaged(obj_damages);
var _wallCollision = true;
//caso que vai gerar spawn dos inimigos  
switch (state)
{
	 //"aparece"
	case -1:
	//fade 
	if image_alpha < 1
	{
		//não anda enquanto a esta em fade in
		speedE = 0;
		image_alpha += fadeSpd;

	}
	
	//anda pra fora do portal
	_wallCollision = false;
	_getDamage = false;
	if image_alpha >= 1 
	{
		speedE = spawnSpd;	
		directE = 270;
	
	}
	
	if !place_meeting(x,y, obj_parede)
	{	
		state = 0;
		
	}
	

	break;

	 //segue - começa a tomar dano 
	case 0:
	
		 //função dano 
		_wallCollision = true;
		_getDamage = true;

		if instance_exists(obj_player)
		{
		directE = point_direction(x,y, obj_player.x, obj_player.y);
	
		}
		
		 speedE = speedCh;		 


	break;
	
	case 1:
	     // arrumando a posição do big tiro 
	
	
	break;
	
}

//pega as velocidades
	xspeedE = lengthdir_x(speedE, directE);
	yspeedE = lengthdir_y(speedE, directE);


//olha para o lado certo
if directE > 90 && directE < 270
{
	face = -1;	
}
else 
{
	face= 1;
}


//Collision
	//wall collision
	if _wallCollision == true 
	{
		if place_meeting( x + xspeedE, y , obj_parede) 
		{
			xspeedE = 0;
		}
		
		if place_meeting( x,  y +yspeedE, obj_parede)  
		{
			yspeedE = 0;
		}
	}
	//enemy collision
		if place_meeting( x + xspeedE, y , obj_enemy_pai) 
		{
			xspeedE = 0;
		}
		
		if place_meeting( x,  y +yspeedE, obj_enemy_pai)  
		{
			yspeedE = 0;
		}
	

//moving 
x += xspeedE;
y += yspeedE;

//profundidade
 depth = -y;

//morte
if _getDamage == true
{
 event_inherited();
}




