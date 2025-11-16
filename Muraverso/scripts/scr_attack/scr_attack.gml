// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_punch(punch){
	if(punch and damageDelayer==0) {
		scr_attack(lastSpeed[0],lastSpeed[1]);
		damageDelayer=cooldownDamage;
		action="atack"
		image_index=0;
	}
	else {
		damageDelayer= max(0,damageDelayer-1);
	}
	
}

function scr_attack(lastX,lastY){
	var height = obj_player_Mura.sprite_height / 2; 
	var ataque
	if(hor!=0 or ver != 0) {
		ataque =instance_create_layer(x+(range*hor),y-height+(range*ver),"Attacks",obj_attack)
	}
	else {
		ataque =instance_create_layer(x+(range*lastX),y-height+(range*ver),"Attacks",obj_attack)
	}
	//var _angle = point_direction(0,0,lastX,lastY);
	ataque.damageReal=damage;
	ataque.hspeed=hsp/5;
	ataque.vspeed=vsp/5;
	ataque.sprite_index = sprDamage;
	ataque.mask_index   = sprDamageMask;
	ataque.image_index  = 0;
	if(ataque.x -x != 0 and (y-height-ataque.y) == 0){
		ataque.image_xscale=rangeX * sign(lastX);
	} else {
		ataque.image_xscale=rangeX;
	}
	if( (y-height-ataque.y) !=0) {
		ataque.image_angle= point_direction(0,0,ataque.x -x,ataque.y -y);
	} 
	ataque.image_yscale=rangeY;
	//if(hor==0) {ataque.image_xscale=rangeX*lastX}
	//else  {ataque.image_xscale=rangeX*lastX}
	//show_debug_message(string(range+sprite_xoffset)+" " + string(range+sprite_yoffset));
	
}