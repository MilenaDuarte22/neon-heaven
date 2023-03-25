//recebe dano
get_damaged(obj_damages);



//morte

if hp <= 0
{
	//adiciona a morte dos inimigos 
	global.enemyKillCount ++;
	
	//determina se dropa ou nao sendo irandom
		
	if global.enemyKillCount mod 10 == 0// 30% de chance 
	{
		instance_create_depth(x , y, depth, obj_heart)
	}
	
	instance_destroy();

}