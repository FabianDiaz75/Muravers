if(global.roundNumber < roundAmount && roundList[global.roundNumber].endCondition(params)){
	global.roundNumber++;
	roundTime = 0;
	if(global.roundNumber < roundAmount){
		var roundActual = roundList[global.roundNumber];
		switch(roundActual.getType()){
			case enum_round_type.combat:
				if(instance_exists(obj_system_spawner)){
					roundActual.setEnemySpawn(obj_system_spawner);
				}
			break;
			case enum_round_type.rest:
				if(instance_exists(obj_system_spawner)){
					roundActual.setEnemySpawn(obj_system_spawner);
				}
				with (obj_enemy_base) { instance_destroy(); }
			break;
			case enum_round_type.special: //LAS RONDAS ESPECIALES NO DEBEN CONTAR PARA EL CONTEO FINAL DE RONDAS
				if(instance_exists(obj_system_spawner)){
					roundActual.setEnemySpawn(obj_system_spawner);
				}
			break;
		}
		
	}	
}
	
roundTime ++;

