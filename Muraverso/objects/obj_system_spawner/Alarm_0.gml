if (enemies_spawned < enemy_count) {
    var spawn_x = x// + random_range(0, room_height); // Randomize X position around generator
    var spawn_y = y// + random_range(0, room_width); // Randomize Y position around generator
    var enemy = instance_create_layer(spawn_x, spawn_y, "Instances", enemy_ballface);
    enemies_spawned += 1; // Increment counter
    alarm[0] = spawn_interval; // Reset alarm for next spawn
} else {
    instance_destroy(); // Destroy generator after spawning all enemies (optional)
}                                    