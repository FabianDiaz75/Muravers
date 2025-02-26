function scr_eny_chase_movement(spd, range, multiplier, dir, dist){		
	var mtp			= multiplier;
	var changeMove	= abs(dist) <= range;
	if(!changeMove){
		mtp = 1;
	}
	var move_x		= lengthdir_x(spd, dir) * mtp;
	var move_y		= lengthdir_y(spd, dir) * mtp;
	x += move_x;
	y += move_y;
}



	    // Move only if no collision is detected
	    /*if (place_free(x + move_x, y)) {
			x += move_x;
	    }
	    if (place_free(x, y + move_y)) {
			y += move_y;
	    }*/
	    // Optional: Local avoidance logic can be added here
		/*if (place_meeting(x + move_x, y + move_y, obj_enemy_base)) {
			var side_direction = dir + 90;
			move_x		= lengthdir_x(spd, side_direction) * mtp;
	        move_y		= lengthdir_y(spd, side_direction) * mtp;
			if (place_free(x + move_x, y)) {
				x += move_x;
		    }
		    if (place_free(x, y + move_y)) {
				y += move_y;
		    }
			
			if(place_meeting(x + move_x, y + move_y, obj_enemy_base)){
				side_direction = dir - 90;
				move_x		= lengthdir_x(spd, side_direction) * mtp;
		        move_y		= lengthdir_y(spd, side_direction) * mtp;
				if (place_free(x + move_x, y)) {
					x += move_x;
			    }
			    if (place_free(x, y + move_y)) {
					y += move_y;
			    }
			}
		}*/