var hor= keyboard_check(ord("D"))-keyboard_check(ord("A"))
var ver= keyboard_check(ord("S"))-keyboard_check(ord("W"))
var dashKey = keyboard_check_pressed(vk_shift);
var punch= keyboard_check_pressed(vk_space);
var spriteOffX  = sprite_xoffset;
var spriteOffY = sprite_yoffset;
if(hor!=0) {lastSpeed[0] = hor}
if(ver!=0) {lastSpeed[1] = ver}
movements(hor, ver, spriteOffX, spriteOffY);	
if(damageDelayer==0) {dash(dashKey, hor, ver, dashTime, dashDelay, dashSpeed, oldSpeed, lastSpeed)}

if(punch and damageDelayer==0) {
	scr_atack(lastSpeed[0],0);
	damageDelayer=cooldDamage;
	sprActual=sprAtack;
	image_index=0;
}else{
	damageDelayer= max(0,damageDelayer-1);
}
	
if(sprActual!=sprDash and sprAtack!=sprActual){
	if(hor!=0) image_xscale=hor;
	else {image_xscale= lastSpeed[0]}
	if((hor!=0 or ver!=0 ) ){
		if(sprActual!=sprRun) sprActual=sprRun;
	}
	else if (sprActual!=sprIdle){sprActual=sprIdle}
}else{
	if (image_index >= image_number - 1) {
		image_index = image_number - 1; // Mantiene en la última imagen
		sprActual=sprIdle;
	}else if(sprActual==sprAtack){spd*=0.2}
}
//show_debug_message(string(sprActual))
