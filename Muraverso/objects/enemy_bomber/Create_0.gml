// Inherit the parent event
event_inherited();
hp				= 1;
dead			= false;
spd				= random_range(0.7, 2);
stepRange		= self.sprite_width * 4;
stepMultiplayer = 2.5;

atkRange		= self.sprite_width * 2;
atkSpd			= 5;
dmg				= 20;
dmgRange		= 4;
initCooldownAtk	= 40;
atkCooldown		= initCooldownAtk;
initAtkTime     = 1;
initPreAtkTime  = 30;

//Transitions
#region Attack Transitions
	attackTransitions = ds_map_create();
	ds_map_add(
		attackTransitions, 
		enemy_state.chase,
		function (_conditions){
			if(_conditions == undefined) return false;
			return (_conditions._duration == 0)
		}
	);
#endregion
#region Charge Transitions
	chargeTransitions = ds_map_create();
	//ds_map_add(
	//	chargeTransitions, 
	//	enemy_state.chase,
	//	function(_conditions){
	//		if(_conditions == undefined) return false;
	//		var outRange = abs(_conditions._dist) > _conditions._range;
	//		return outRange && (_conditions._cooldown == 0)
	//	}
	//);
	ds_map_add(
		chargeTransitions, 
		enemy_state.attack,
		function(_conditions){
			if(_conditions == undefined) return false;
			return (_conditions._duration == 0)
		}
	);
#endregion
#region Hurt Transitions
	hurtTransitions = ds_map_create();
	ds_map_add(
		hurtTransitions, 
		enemy_state.die,
		function(_conditions){
			show_debug_message("test1")
			if(_conditions == undefined) return false;
			return (_conditions._duration == 0)
		}
	);
#endregion

//New states
#region Attack State
	stateMachine.addState(new EnemyState(
		enemy_state.attack,
		function (){},
		function (_parameters){
			if (!is_undefined(_parameters)) {
				scr_eny_basic_attack(
					"Attacks", 
					obj_eny_blast,
					0, 
					_parameters._dmg, 
					_parameters._dmg_range, 
					_parameters._dmg_range, 
					_parameters._dir_atk
				);
			} else {
				show_debug_message("Error: _parameters is undefined");
			}
		},
		function (_exit_params){ instance_destroy(); },
		attackTransitions
	));
#endregion
#region Charge State
	stateMachine.addState(new EnemyState(
		enemy_state.charge,
		function (){},
		function (_parameters){
			if (!is_undefined(_parameters)) {
				scr_eny_chase_movement(
					_parameters._spd, _parameters._range, _parameters._range_mtp, 
					_parameters._dir, _parameters._dist
				);
			} else {
				show_debug_message("Error: _parameters is undefined");
			}
			self.image_blend = c_ltgray;
		},
		function (_exit_params){
			if(_exit_params != undefined){
				self.lastDirAtk	 = _exit_params._dir;
			}
			self.atkDuration = self.initAtkTime;
			self.image_blend = c_white;
		},
		chargeTransitions
	));
#endregion
#region Hurt State
	stateMachine.addState(new EnemyState(
		enemy_state.hurt,
		function (){},
		function (_parameters){
			self.image_blend = c_ltgray;
		},
		function (_exit_params){
			if(_exit_params != undefined){
				self.lastDirAtk	 = _exit_params._dir;
			}
			self.atkDuration = self.initAtkTime;
			self.image_blend = c_white;
		},
		hurtTransitions
	));
#endregion
#region Die State
	stateMachine.addState(new EnemyState(
		enemy_state.die,
		function (){},
		function (_parameters){
			show_debug_message("test1")
			if (!is_undefined(_parameters)) {
				scr_eny_basic_attack(
					"Attacks", 
					obj_eny_blast,
					0, 
					_parameters._dmg, 
					_parameters._dmg_range, 
					_parameters._dmg_range, 
					_parameters._dir_atk
				);
				instance_destroy();
			} else {
				show_debug_message("Error: _parameters is undefined");
			}
		},
		function (_exit_params){  },
		ds_map_create()
	));
#endregion