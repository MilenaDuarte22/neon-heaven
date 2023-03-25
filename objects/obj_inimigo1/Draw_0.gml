draw_self();
//desenhando a lifebar

var _healthPercent = hp/maxHp;
var _hpImage = _healthPercent * (sprite_get_number(spr_enemyLifeBar) -  1);
draw_sprite_ext(spr_enemyLifeBar , _hpImage , x , y - sprite_height - 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha); //desenha minha life bar 