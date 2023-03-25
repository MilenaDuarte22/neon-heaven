get_damaged( obj_damage_parent);

var _healthpercent = 1 - (hp / maxHp);
image_index = _healthpercent * (image_number);

if hp <= 0
{
	instance_destroy();

}