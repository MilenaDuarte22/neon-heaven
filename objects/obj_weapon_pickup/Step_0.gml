
floatDir += floatSpd;
y = ystart + dsin(floatDir) *2;

var _size = array_length(global.PlayerWeapons);
for (var i = 0 ; i < _size; i++)
{
	if weapon == global.PlayerWeapons[i]
	{
		//se destroi 
		instance_destroy();
		exit;
	}
}

//adiciona arma pra lista do player
if place_meeting (x, y, obj_player)
{
	array_push(global.PlayerWeapons, weapon)
	obj_player.selected_Weapon = array_length(global.PlayerWeapons) -1;
	//destroy
	instance_destroy();
}