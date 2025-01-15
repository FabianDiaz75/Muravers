// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function movements(){

	
	var hor= keyboard_check(ord("D"))-keyboard_check(ord("A"))
	var ver= keyboard_check(ord("S"))-keyboard_check(ord("W"))
	if(hor!=0 or ver!=0)
	{
		//dir =point_direction(0,0,hor,ver);
		//hsp=lengthdir_x(spd,dir);
		//vsp=lengthdir_y(spd,dir);
		hsp=spd*hor;
		vsp=spd*ver;
	}
	else
	{
		if(hsp>0.1 or hsp<-0.1) {hsp=lerp(hsp,0,0.1)}
		else hsp=0;
		if(vsp>0.1 or vsp<-0.1) {vsp=lerp(vsp,0,0.1)}
		else vsp=0;
	}
	if place_meeting(x+hsp,y,obj_wall) {hsp=0}
	if place_meeting(x,y+vsp,obj_wall) {vsp=0}
	vspeed=vsp
	hspeed=hsp
}