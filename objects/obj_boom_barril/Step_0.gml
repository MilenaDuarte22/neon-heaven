get_damaged(obj_damage_parent);

//mostra o dano do barril 
var _healthPercent = 1 - (hp/maxHp);
image_index = _healthPercent * image_number ;


if hp <= 0
{
	//cria a explosão
	var _exploInt = instance_create_depth( x + 16, y + 16, -3000, obj_explosao );
	with(_exploInt)
	{
		//aumentei a explosao
		image_xscale = 2;
		image_yscale = 2;
	
	}
	//destroi
	instance_destroy();
}
