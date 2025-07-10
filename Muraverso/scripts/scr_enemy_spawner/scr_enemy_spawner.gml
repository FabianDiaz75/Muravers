function scr_enemy_spawner(enemy_map){
	#region Validation of enemy map
		//if (!ds_exists(enemy_map, ds_type_map)) {
		//	show_error("Invalid 'enemy_map' attribute scr_enemy_spawner.", true);
		//} else {
		//	var key  = ds_map_keys_to_array(enemy_map);
		//	var size = array_length(key);
		//	for (var i = 0; i < size; i += 1){	
		//		var percentage = enemy_map[? key[i]];
		//		var obj_index = asset_get_index(key[i]);
		//		if (!object_exists(obj_index)) {
		//			  show_error("Invalid object '[" + string(i) + "]' map scr_enemy_spawner", true);
		//		}	
		//		if (!is_numeric(percentage)) {
		//			  show_error("Invalid number '[" + string(i) + "]' map scr_enemy_spawner", true);
		//		}
		//	}	
		//}
	#endregion
	
	var key   = ds_map_keys_to_array(enemy_map);
	var size  = array_length(key);
	var total = 0;
	for (var i = 0; i < size; i += 1){	
		total += enemy_map[? key[i]];
	}
	
	if(total != 0){
		var randomSpawn = irandom_range(1, total);
		var cumulative = 0;
		for (var i = 0; i < size; i++) {
		    cumulative += enemy_map[? key[i]];
		    if (randomSpawn <= cumulative) {
		        return key[i];
		    }
		}	
	}
	return undefined
}