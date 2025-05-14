function scr_eny_long_attack(atk_layer, atk_obj, atk_range, damage, atk_rangeX, atk_rangeY, dir, atk_spd){
	var attack = instance_create_layer(
	    x + lengthdir_x(atk_range, dir),
	    y + lengthdir_y(atk_range, dir),
		atk_layer,
		atk_obj
	);
	attack.damage		= damage;
	attack.spd			= atk_spd;
	attack.dir			= dir;
	//ataque.sprite_index=sprDamage;
	attack.image_index  = 0;
	attack.image_xscale = atk_rangeX;
	attack.image_yscale = atk_rangeY;
}