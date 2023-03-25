//efeitinho de flutuar
floatDir += floatSpd;
y = ystart + dsin(floatDir) *2;


if place_meeting(x , y , obj_player)
{
	//cura o player
	obj_player.hp += heal;
	
	//destroy o coração
	instance_destroy();
}