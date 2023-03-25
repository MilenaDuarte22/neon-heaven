/// todo objeto aqui roda antes do etapa 
global.rightButton = keyboard_check(ord("D"));
global.leftButton = keyboard_check(ord("A"));
global.upButton = keyboard_check(ord("W"));
global.downButton = keyboard_check(ord("S"));
// input mouse atirar / troca arma 
global.shootbutton = mouse_check_button(mb_left);
global.swapbutton = mouse_check_button_pressed(mb_right);
