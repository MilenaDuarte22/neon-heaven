//damage setup
 get_damaged_create(20, true); //vida do player 20
 
//variaveis para a movimentação 
movedirect = 0; //360 graus
moveSpd = 2; //speed em pixel per frame
xspeed = 0; // move direita esquerda 
yspeed = 0; //sao variaveis pra ir cima/baico

// controles do sprite - funciona na orientação de relogio 
	spr_dir = 0;
	sprite[0] = spr_player_correndo_direita; //0
	sprite[1] = spr_player_correndo_cima; //90
	sprite[2] = spr_player_correndo_esquerda; //180
	sprite[3] = spr_player_correndo_baixo; //360

// controle sprite arma mouse
	centerYOffset = -6; //essa é a altura do personagem até o centro
	centerY = y + centerYOffset; // seti in step event - essa variavel retorna a soma do nosso y inicial + O "MEIO" do sprite 
	
	arma_direct = 0; 
	armaOffsetDist = 4; //essa variavel afasta a arma do player
	
// 	variaveis relacionada as armas
	shootTimer = 0;
	
// player inventario 
	array_push(global.PlayerWeapons, global.WeaponList.arma1);
	//ou seja a primeira posição do array é a arma1[0]
	
	
	selected_Weapon = 0;
	weapon = global.PlayerWeapons[selected_Weapon]; //essa linha chama o struct do script de armas
	


	