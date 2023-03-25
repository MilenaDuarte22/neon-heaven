/// pega o hp do player

if instance_exists(obj_player)
{
	playerHp = obj_player.hp;
	playerMaxhp = obj_player.maxHp;
}
else
{
	playerHp = 0;
}