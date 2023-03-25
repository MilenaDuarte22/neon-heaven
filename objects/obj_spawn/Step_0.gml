//codigo que vai dar spwan nos inimigos 

timer ++;

//reseta o timer quando bate o limite de inimigos 
if instance_number( obj_enemy_pai) >= global.activeEnemyMax || global.totalEnemySpawnd >= global.enemyRoomMax
{
	timer = 0;
}

if timer >= spawnTime && !place_meeting(x , y , obj_inimigo1)
{
	//cria inimigos
	var _inst = instance_create_depth(x , y, depth -1, obj_inimigo1);
	with(_inst)
	{
		image_alpha = 0;
		state = -1;
	}	
	timer = 0;
	
}