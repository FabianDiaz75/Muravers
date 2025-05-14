test1 = 0;
test2 = 1;
initCooldown = 10;
cooldown     = initCooldown;

stateMachine = new StateMachine();
stateMachine.addState(new EnemyState(
	enemy_state.chase,
	function (){},
	function (_parameters){
		if (!is_undefined(_parameters)) {
			self.x += _parameters._x;
			self.y += _parameters._y;
		} else {
	        show_debug_message("Error: _parameters is undefined");
	    }
	},
	function (){},
	function(_conditions){
		if(_conditions == undefined) return false;
		var inRange = abs(_conditions._dist) > 500;
		return inRange && (_conditions._cooldown == 0)
	}
));
stateMachine.addState(new EnemyState(
	enemy_state.idle,
	function (){},
	function (_parameters){
		if (!is_undefined(_parameters)) {
			self.test1 += _parameters._x;
			self.test2 += _parameters._y;
	    } else {
	        show_debug_message("Error: _parameters is undefined");
	    }
	},
	function (){},
	function(_conditions){
		if(_conditions == undefined) return false;
		var inRange = abs(_conditions._dist) <= 500;
		return inRange && (_conditions._cooldown == 0)
	}
));
stateMachine.setInitialState(enemy_state.idle);
state = undefined;