/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

directE = 0;
speedE = 0;
speedCh = .3;
//state machine
state = 0;
// estado de atirar
cooldownTime = 4 * 60; //é um cooldown de 5 segundos 
shootTimer = irandom (cooldownTime);
windUpTimer = 60; //1 fr ame
recoverTimer = 45;
bulletInst = noone; // falso\zero etc

// arrumando a posição do big tiro 
bulletXoff = 5;
bulletYoff =-8;