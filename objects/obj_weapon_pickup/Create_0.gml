//floating 
floatDir = 0;
floatSpd = 6;

depth = -y;
//variavel que tem a informação das nossas armas 
//troca de arma baseada na index da img

if image_index == 0
{
	weapon = global.WeaponList.arma1;
}
if image_index == 1
{
	weapon = global.WeaponList.arma2;
}
if image_index == 2
{
	weapon = global.WeaponList.arma3;
}

sprite_index = weapon.pickupSprite;
image_index = 0;

// o player tem as armas? se sim ela n aparece dnv
var _size = array_length(global.PlayerWeapons);
for (var i = 0 ; i < _size; i++)
{
	if weapon == global.PlayerWeapons[i]
	{
		//se destroi 
		instance_destroy();
	}
}