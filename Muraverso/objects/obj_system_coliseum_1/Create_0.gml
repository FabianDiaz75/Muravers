event_inherited();

#region Round 1
roundList[0] = new Round();
enemyMap0	 = ds_map_create();
	ds_map_add(enemyMap0, enemy_chaser, 1);
spawnData0		= new SpawnData();
	spawnData0.createSpawnData(60, 40, 40, enemyMap0);
roundList[0].createRound(
	1,
	enum_round_type.combat,
	spawnData0, 
	function (){
		return (self.roundTime >= 1000) //60 ticks == 1 seg
	},
	undefined
)
#endregion
#region Round 2
roundList[1] = new Round();
enemyMap0		= ds_map_create();
	ds_map_add(enemyMap0, enemy_chaser, 4);
	ds_map_add(enemyMap0, enemy_sentinel, 1);
spawnData0		= new SpawnData();
	spawnData0.createSpawnData(30, 40, 40, enemyMap0);
roundList[1].createRound(
	2,
	enum_round_type.combat,
	spawnData0, 
	function (){
		return (self.roundTime >= 1000) //60 ticks == 1 seg
	},
	undefined
)
#endregion
#region Round 3
roundList[2] = new Round();
enemyMap0		= ds_map_create();
	ds_map_add(enemyMap0, enemy_bomber, 1);
spawnData0		= new SpawnData();
	spawnData0.createSpawnData(30, 40, 40, enemyMap0);
roundList[2].createRound(
	3,
	enum_round_type.combat,
	spawnData0, 
	function (){
		return (self.roundTime >= 1000) //60 ticks == 1 seg
	},
	undefined
)
#endregion

roundAmount = array_length(roundList);
if(instance_exists(obj_system_spawner)){
	roundList[0].setEnemySpawn(obj_system_spawner);
	params		= roundList[0].getParams();
}
