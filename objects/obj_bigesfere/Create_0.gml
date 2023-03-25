/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

directE = 0;
speedE = 2;
xspeed = 0;
yspeed = 0;

//state
state = 0; //0 = not moving, esperando player e inimigo atirar
//1 = atirar contra o player;

//cleanup section - para a esfera se destruir
destroy = false;
playerDestroy = true;

 