/// cria objs dano

if createDamageObj == false
{
	//cria obj para dar dano  nos inimigos 
	damageInst = instance_create_depth(x , y , 0, obj_damageAll);
	with(damageInst)
	{
		 damage = other.damage;
		 mask_index = other.sprite_index;
		 image_xscale = other.image_yscale;
		 image_yscale = other.image_xscale;
	}

	//variavel  createdamag vira true 
	createDamageObj = true;
}

//limita os frames de dano
if floor(image_index) > 1 //o floor arredonda pra baixo sempre 
{
	//destroi 
	if instance_exists(damageInst)
	{
		instance_destroy(damageInst);
	}
	
	
}