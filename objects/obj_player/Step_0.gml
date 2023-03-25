#region // codigo movimentação 
//inputs teclado andar 

rightButton = global.rightButton;
leftButton = global.leftButton;
upButton = global.upButton;
downButton = global.downButton;
// input mouse atirar / troca arma 
shootbutton = global.shootbutton;
swapbutton = global.swapbutton;


//player movimentar 
	var _horizButton = rightButton - leftButton ; //variavel local só funciona daqui pra baixo 
	var _verticalButton = downButton - upButton;
	movedirect = point_direction(0, 0, _horizButton, _verticalButton); //linha responsavel por calcular onde voce se encontra no plano
	
 // velocidades pra x . y = vertical horizontal
	var _speed = 0;
	var _inputLevel = point_distance(0, 0 , _horizButton, _verticalButton);
 	_inputLevel = clamp (_inputLevel, 0 , 1);
	_speed = moveSpd * _inputLevel;
	
	xspeed = lengthdir_x(_speed, movedirect );
	yspeed = lengthdir_y(_speed, movedirect);
	
	if place_meeting(x + xspeed, y , obj_parede)
	{
		xspeed = 0;
	}
	if place_meeting(x, y + yspeed, obj_parede )
	{
		yspeed = 0;
	}
	
// adicionando a velocidade de movimento do player
	x += xspeed;
	y += yspeed;
	
#endregion

 
#region //controles de sprite - direções 

//codigo arma 
centerY = y + centerYOffset;
arma_direct = point_direction(x, centerY, mouse_x, mouse_y);


//controles do sprite
	spr_dir = round(arma_direct / 90);
		
	if spr_dir == 4 
	{
		spr_dir = 0;
	}
	// animação para se a gente não move 
	
	if xspeed == 0 && yspeed == 0
	{
		image_index = 0; //é o frame 0 que ta no array
	}
	
	
	mask_index = sprite[3];
	sprite_index = sprite[spr_dir];
	
	//profundidade - para dar uma impressão 3d
	depth = -bbox_bottom; //bbox_botton é a parte de baixo da mascara de colisão.
	
#endregion


#region //troca de armas
//quando precisamos chamar uma Var global varias vezes o ideal é salva-la em uma variavel local 
	var _playerWeapons = global.PlayerWeapons; 
	
	if swapbutton
	{
		selected_Weapon++;
		if selected_Weapon >= array_length(_playerWeapons)
		{
			selected_Weapon = 0;
		
		}
	}
	//botão troca de arma 
	weapon = _playerWeapons[selected_Weapon];	
	

#endregion


#region // atira  

if shootTimer> 0 { shootTimer --;};
if shootbutton && shootTimer <= 0
{
	
	shootTimer = weapon.sCoolDown;
	
	//criando uma instancia e a função retorna a nova identificação do bullet nas var
	var _xOffset = lengthdir_x( weapon.length + armaOffsetDist , arma_direct);	
	var _yOffset = lengthdir_y( weapon.length + armaOffsetDist , arma_direct);
	
	// variaveis que vao calcular a distan entre as balas 
	var _spread = weapon.spread;
	var _spreadDiv = _spread / max(weapon.bulletNum -1, 1);
	
	
	for( var i  = 0; i < weapon.bulletNum; i++) // responsavel pela quantidade de balas por vez
	{
	
			var _bulletInst = instance_create_depth(x + _xOffset, centerY + _yOffset, depth-100, weapon.balasObj);

			// direção das balas 
			with ( _bulletInst ) 
			{
				directb = other.arma_direct - _spread/2 + _spreadDiv * i; //o other checa o arma_direct 
		
			}
	}
}

#endregion

#region //chama a função de dano por frame 

 get_damaged(obj_dano_player, true); 


#endregion

#region // morte -  game over 
//death 

if hp <= 0
{
	//game over obhjeto 
	instance_create_depth(0, 0, -10000, obj_GameOver_screen)
	//se destroy
	instance_destroy();

}

#endregion