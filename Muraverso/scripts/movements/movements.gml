// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function movements(hor, ver, spriteOffX, spriteOffY){
	if(hor!=0 or ver!=0)
	{
		dir =point_direction(0,0,hor,ver);
		hsp=lengthdir_x(spd,dir);
		vsp=lengthdir_y(spd,dir);
		lastSpeed = [hor, ver];
	}
	else
	{
		if(hsp>0.1 or hsp<-0.1) {hsp=lerp(hsp,0,0.1)}
		else hsp=0;
		if(vsp>0.1 or vsp<-0.1) {vsp=lerp(vsp,0,0.1)}
		else vsp=0;
	}
	if place_meeting(x + hsp,y,obj_wall) {
		repeat(hsp){
			if(!place_meeting(x+sign(hsp),y,obj_wall)) x+=sign(hsp);
			else{break}
		}
		hsp=0;
	}
	if place_meeting(x,y+vsp,obj_wall) {
		repeat(vsp){
			if(!place_meeting(x,y+sign(vsp),obj_wall)) y+=sign(vsp);
			else{break}
		}
		vsp=0;
	}	
	vspeed=vsp
	hspeed=hsp
	
}

function dash(dashKey, horKey, verKey, time, delay, dashSpeed, oldSpd, lastDir){
	dashDelayer  = max(dashDelayer - 1, 0);
	
	if(dashKey && (dashDelayer == 0)) {
		dashDelayer = delay;
		spd = dashSpeed;
		sprActual=sprDash;
		if(horKey == 0 && verKey == 0){
		    hsp = spd * lastDir[0];  
		    vsp = spd * lastDir[1];
		}
	} else {
		spd = max(oldSpd, spd -4);
		if(dashDelayer==0 and sprActual==sprDash) sprActual=sprRun;
	}
}