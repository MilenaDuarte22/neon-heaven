/// pega a coordenadas da camera para posicionar o desenho

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
//coordenadas central hud
var _border = 5;
var _hudX =  _camX + _border;
var _hudY = _camY + _border;
//desenha a hp do player
if instance_exists(obj_player)
{
draw_sprite(spr_lifeBar, 0 ,  _hudX , _hudY );
//loop que desenha a vida 

for(var i = 0 ;  i < playerMaxhp; i++)
{
	// mostra nosso hp 
	var _img = 1;
	if i + 1 <= playerHp { _img = 2 ;};
	var _sep = 4.5; //espaço entre as barras 
	draw_sprite(spr_lifeBar, _img , _camX + _border * 3.5 + _sep * i, + _camY + _border * 2);
}
//o frame 1 é a parte vazia/ 2 a cheia 
}


//draw enemycountbar

//_enemyHudx é a var que vamos usar pra controlar a posição x y
var _enemyCountOffset = 28; //para separar a barra inimigos e a lifebar
var _enemyHudX = _hudX;
var _enemyHudY = _hudY + _enemyCountOffset;

//desenha a sprite
draw_sprite(spr_enemycount, 0 , _enemyHudX , _enemyHudY );

//desenha o texto
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(Font1);

// desenhou aqui so o total de inimigos mortos 
draw_text( _enemyHudX + 28, _enemyHudY + 6, string(global.enemyKillCount));

//capacidade max da sala 
draw_text(_enemyHudX + 42, _enemyHudY + 6, " / " + string(global.enemyRoomMax) );

