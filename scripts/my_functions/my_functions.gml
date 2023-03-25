// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_my_weapon()
{
//desenho arma 
	//variavel para a arma vai ficar mais afastada do corpo do personagem
	var _xOffset = lengthdir_x(armaOffsetDist, arma_direct);
	var _yOffset = lengthdir_y(armaOffsetDist, arma_direct);


	//flipa a arma pra cima quando ela vai pras costas do personagem ou seja + 90
	var _sclarma = 1; //essa variavel local muda a orientação da arma
	if arma_direct > 90 && arma_direct < 270
	{
		_sclarma = -1;
	}

	draw_sprite_ext(weapon.sprite , 0 , x + _xOffset, centerY + _yOffset, 1, _sclarma, arma_direct, c_white, 1);

}


function get_damaged_create( _hp = 10, _iframes = false)
{
	maxHp = _hp;
	hp = _hp;
	// get the iframes 
	if _iframes == true 
	{
		iframeTimer = 0;
		iframeNumber = 90; //1 segundo e meio de invencibilidade
	}
	
	if _iframes == false 
	{
	damageList = ds_list_create();
	}
}

function get_damage_cleanup()
{
	ds_list_destroy(damageList);
	
}

// calculando dano - damage step event
function get_damaged( _damageObj, _iframes = false )
{
	//special exit for iframe timer 
	if _iframes == true  && iframeTimer > 0
	{
	iframeTimer--;
	
	//timer pra invencibilidade nao piscar loucamente
	if iframeTimer	mod 4 == 0 // a cada 4 frames o codigo vai rodar
	{
	//fazer o personagem piscar enquanto voce ta nos frames de invencibilidade
		if image_alpha == 1 //se image_alpha é visivel
		{
			image_alpha = 0; //vai piscar 
		}
		else
		{
			image_alpha = 1; //proximo frame deixa ela visivel dnv
		}
	}	
		hp = clamp(hp , 0 , maxHp);
		exit;
		//o exit vai terminar o codigo nesse ponto 
	}
	
	//o iframe para de piscar 
	if _iframes == true
	{
	image_alpha = 1;
	}
	
	
	//receive damage 
	var _hitConfirm = false;
	if place_meeting(x , y ,_damageObj) || (_damageObj != obj_damage_parent && place_meeting(x , y, obj_damageAll ))
	{
	 //pega o dano de todas as intancias 
	var _instList = ds_list_create();
	instance_place_list( x, y,_damageObj, _instList, false);
	
	if _damageObj != obj_damage_parent
	{
		instance_place_list( x, y,obj_damageAll, _instList, false);
	}
   //pega o tam da lista de instancias 
	var _listSize = ds_list_size(_instList);
		  
	var _hitConfirm = false ;
	for(var i = 0; i< _listSize; i++)
	{
		//pega o dano das instancias especificas
		var _inst = ds_list_find_value( _instList, i);
		//checa se a instancia estada na damage list 
		if _iframes == true || ds_list_find_index( damageList, _inst) == -1
		{
			//adiciona o novo damage instance á lista 
			if _iframes == false
			{
				ds_list_add (damageList, _inst);
			}
			//pega o dano da instancia especifica 
			hp -= _inst.damage;
			_hitConfirm = true;
			//fala para as instancias elas tem impacto 
			_inst.hitConfirm = true;
			
	}	
 }
	 
	 //verifica com o iframes se fomos atingido 
	 
		 if _iframes == true && _hitConfirm == true
		 {
			iframeTimer = iframeNumber;
	 
		 }
	 
		 //destroy a ds list e poupa nossa memoria 
		 ds_list_destroy(_instList);
	}

	//clear damage list 
	if _iframes = false 
	{
	 var _damageListSize = ds_list_size(damageList);
	
		for(var i = 0; i< _damageListSize; i++)
		{
			var _inst = ds_list_find_value(damageList, i);
			if !instance_exists(_inst) ||  !place_meeting(x, y, _inst)
			{
				ds_list_delete( damageList, i);
				i --;
				_damageListSize --;
			 }
		}
	}

	//clamp hp
		hp = clamp(hp , 0 , maxHp);

}
