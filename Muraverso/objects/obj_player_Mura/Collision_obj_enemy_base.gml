if(!invincible){
	hp			   -= obj_enemy_base.dmg
	invincible		= true;
	alarm[0]		= invincibility_duration;
	/*hsp = hsp * -10;
	vsp = vsp * -10;*/
	if(hp <= 0){
		instance_destroy();
	}
}