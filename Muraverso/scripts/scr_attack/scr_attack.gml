// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_punch(punch){
	if(punch and damageDelayer==0) {
		scr_attack(lastSpeed[0],lastSpeed[1]);
		damageDelayer=cooldDamage;
		action="atack"
		image_index=0;
	}
	else
	{
		damageDelayer= max(0,damageDelayer-1);
	}
	
}

function scr_attack(lastX,lastY){
	if(hor!=0 or ver != 0) {var ataque =instance_create_layer(x+(range*hor),y+(range*ver),"Attacks",obj_attack)}
	else {var ataque =instance_create_layer(x+(range*lastX),y+(range*ver),"Attacks",obj_attack)}
	//var _angle = point_direction(0,0,lastX,lastY);
	ataque.damageReal=damage;
	ataque.hspeed=hsp/5;
	if((y-ataque.y)!=0 ) {ataque.image_angle= point_direction(0,0,-x+ataque.x,-y+ataque.y)}
	ataque.vspeed=vsp/5;
	ataque.sprite_index=sprDamage;
	ataque.mask_index= sprDamageMask;
	ataque.image_index=0;
	if(hor==0) {ataque.image_xscale=rangeX*lastX}
	else  {ataque.image_xscale=rangeX*lastX}
	ataque.image_yscale=rangeY;
	//show_debug_message(string(range+sprite_xoffset)+" " + string(range+sprite_yoffset));
	
}