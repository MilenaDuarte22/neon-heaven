//contructor para armas, modelo de estrutura de como as armas serão 
function weapon_criation( _sprite = spr_arma1, _weaponlength = 0, _objbullet = obj_bullet, _cooldown = 1, _bulletNum = 1, _spread = 0 , _pickupSprite = spr_arma1) constructor
{ 
	
		sprite = _sprite;
		length =  _weaponlength;
		balasObj = _objbullet;
		sCoolDown = _cooldown;
		bulletNum = _bulletNum;
		spread = _spread;
		pickupSprite = _pickupSprite ;

}

// inventario de armas do jogador, esse array chama as armas com o pressionar do botão

global.PlayerWeapons = array_create(0);


//criação de armas, seguindo o modelo do constructor ----//


//struct
global.WeaponList = { // fizemos uma variavel global que podemos usar para chamar o struct

	arma1 : new weapon_criation(
		//esse weapon_criation agora é uma função 
		spr_arma1,
		sprite_get_bbox_right(spr_arma1) -sprite_get_xoffset(spr_arma1),
		obj_bullet,
		10,
		1,
		0,
		spr_arma1_pickup
	
	),
	
	
	arma2 : new weapon_criation(
	
		spr_arma2,
		sprite_get_bbox_right(spr_arma2) -sprite_get_xoffset(spr_arma2),
		obj_bullet2,
		5,
		1,
		0,
		spr_arma2_pickup
	
	),
	
	arma3 : new weapon_criation(
	
		spr_arma3,
		sprite_get_bbox_right(spr_arma3) -sprite_get_xoffset(spr_arma3),
		obj_bullet3,
		16,
		3,
		45,
		spr_arma3_pickup
	),
	

}