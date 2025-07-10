enum enum_round_type {
	combat,
	rest,
	special,
	ending
}

function Round() constructor{
	__number		= 0;
	__type			= enum_round_type.special;
	__spawn_data	= undefined;
	__params		= undefined;
	__end_condition = undefined;
	
	static createRound = function(_number, _type, _spawn_data, _end_condition, _params){
		#region createRound parameter validation
		#endregion
		
		__number		= _number;
		__type			= _type;
		__spawn_data	= _spawn_data;
		__end_condition = _end_condition;
		__params		= _params;
	}
	
	static endCondition = function(_params){
		return __end_condition(_params);
	}
	
	static setEnemySpawn = function(_spawner){
		#region setRound parameter validation
			if(!(_spawner.object_index == obj_system_spawner)){
				show_error("Invalid '_spawner' parameter. Must be obj_system_spawner.", true);
			}
		#endregion
		_spawner.spawn_data = self.__spawn_data;
	}
	
	static getParams = function(){
		return __params
	}
	
	static getType = function(){
		return __type
	}
}