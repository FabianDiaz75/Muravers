function SpawnData() constructor{
	spawn_rate		= 0;
	spawn_capacity	= 0;
	spawn_limit		= 0;
	enemy_map		= ds_map_create();
	
	static createSpawnData = function(_spawn_rate, _spawn_capacity, _spawn_limit, _enemy_map){
		#region SpawnData parameter validation
			
		#endregion
		
		spawn_rate		= _spawn_rate;
		spawn_capacity	= _spawn_capacity;
		spawn_limit		= _spawn_limit;
		enemy_map		= _enemy_map;
	}
}