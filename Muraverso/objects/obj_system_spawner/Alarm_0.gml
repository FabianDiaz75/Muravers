if (enemies_spawned <= 40) {
    var spawn_x = x// + random_range(0, room_height); // Randomize X position around generator
    var spawn_y = y// + random_range(0, room_width); // Randomize Y position around generator
	if(enemies_spawned mod 2 == 0){
		var enemy = instance_create_layer(spawn_x, spawn_y, "Instances", enemy_chaser);
	} else if (enemies_spawned mod 3 == 0){
		var enemy = instance_create_layer(spawn_x, spawn_y, "Instances", enemy_sentinel);
	} else {
		var enemy = instance_create_layer(spawn_x, spawn_y, "Instances", enemy_bomber);
	}
    
    enemies_spawned += 1; // Increment counter
    alarm[0] = spawn_interval; // Reset alarm for next spawn
} else {
    instance_destroy(); // Destroy generator after spawning all enemies (optional)
}                                    