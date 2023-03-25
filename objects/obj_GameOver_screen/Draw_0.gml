var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y( view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

//desenha um retangulo
draw_set_alpha(alpha * alphaMax); // tudo desenhado apos isso vira alpha value 
draw_rectangle_color(_camX, _camY, _camX + _camW ,  _camY + _camH, c_black,  c_black , c_black ,  c_black, false );
draw_set_alpha(1);

//draw_text 
//esses dois primeiros draw set são para alinhar o texto 
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _gameOverOffset = -32;
draw_set_alpha(alpha); //letras opacas 
draw_set_font(Font1);//mudando a fonte

//gamer over 
draw_text_transformed(_camX + _camW/2 + _gameOverOffset, _camY + _camH/2, "Game Over", 2 , 3 , 0);
//press shoot restart
var _restartOffset = 60;
draw_text_transformed( _camX + _camW/2, _camY + _camH/2 + _restartOffset ,"-Pressione atirar-", 2, 2, 0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);