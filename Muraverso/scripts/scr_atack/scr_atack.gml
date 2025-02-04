// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_atack(lastX,lastY){
	var ataque =instance_create_layer(x+(range)*lastX,y+(range*lastY),"Atacks",obj_atack);
	ataque.damageReal=damage;
	ataque.sprite_index=sprDamage;
	ataque.image_index=0;
	ataque.image_xscale=rangeX*lastX;
	ataque.image_yscale=rangeY;
	ataque.damageImage=6;
	//show_debug_message(string(range+sprite_xoffset)+" " + string(range+sprite_yoffset));
	
}