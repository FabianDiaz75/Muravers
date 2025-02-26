function scr_eny_basic_attack(atk_layer, atk_range, damage, atk_rangeX, atk_rangeY, dir){
	var attack = instance_create_layer(
	    x + lengthdir_x(atk_range, dir),
	    y + lengthdir_y(atk_range, dir),
		atk_layer,
		obj_eny_attack
	);
	attack.damage		= damage;
	//ataque.sprite_index=sprDamage;
	attack.image_index  = 0;
	attack.image_xscale = atk_rangeX;
	attack.image_yscale = atk_rangeY;
	attack.damageImage  = 6;
}