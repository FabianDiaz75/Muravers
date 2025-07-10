if (global.enemies_active <= spawn_data.spawn_capacity) {
	var spawn_x = choose(random_range(0 -bufferX, 0), random_range(room_width, room_width + bufferX));
    var spawn_y = choose(random_range(0 -bufferY, 0), random_range(room_height, room_height + bufferY));
	
	var enemy_enty = scr_enemy_spawner(spawn_data.enemy_map);
	if(enemy_enty != undefined){
		var enemy = instance_create_layer(spawn_x, spawn_y, "Instances", enemy_enty);
	}
    global.enemies_active ++; // Increment counter
    alarm[0] = spawn_data.spawn_rate; // Reset alarm for next spawn
}         
