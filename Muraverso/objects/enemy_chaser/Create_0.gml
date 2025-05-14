event_inherited();

atkRange = self.sprite_width + 32;

//Transitions
attackTransitions = ds_map_create();
ds_map_add(
	attackTransitions, 
	enemy_state.chase,
	function (_conditions){
		if(_conditions == undefined) return false;
		return (_conditions._duration == 0)
	}
);

//New states
stateMachine.addState(new EnemyState(
		enemy_state.attack,
		function (){},
		function (_parameters){
			if (!is_undefined(_parameters)) {
				scr_eny_basic_attack(
					"Attacks", 
					obj_eny_attack,
					self.sprite_width, 
					_parameters._dmg, 
					_parameters._dmg_range, 
					_parameters._dmg_range, 
					_parameters._dir_atk
				);
			} else {
				show_debug_message("Error: _parameters is undefined");
			}
		},
		function (_exit_params){
			self.lastDirAtk = 0;
			self.atkCooldown = self.initCooldownAtk;
		},
		attackTransitions
));