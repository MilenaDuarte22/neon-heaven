//movimentação bala 

	xspeed = lengthdir_x(speedb , directb);
	yspeed = lengthdir_y(speedb, directb);

	x += xspeed;
	y += yspeed;
	
//clean up
	//hit confirm destroy - 
	
	if hitConfirm == true && enemyDestroy == true { destroy = true;};
	
	// destroy -
	 if destroy == true 
	 {
		instance_destroy();
	 
	 }

	//colisão (para a bala sendo depois dos cod de movimentação)
	if place_meeting(x , y , obj_parede_solida)
	{
		destroy = true;
	}
	
	//	bullet rage (distancia)
	
	if point_distance(xstart, ystart, x , y ) > maxDist
	{
		destroy = true;
	}
	
	