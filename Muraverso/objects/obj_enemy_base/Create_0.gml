stateMachine	= new StateMachine();

hp				= 60;
def				= 0;
spd				= random_range(0.5, 1.5);
stepRange		= 32 * 5; //cambiar 32 por variable global que indique el ancho del mundo
stepMultiplayer = 1;

atkRange	 	= obj_enemy_base.sprite_width;
dmg				= 1;
dmgRange		= 1;
initCooldownAtk	= 60;
initAtkTime     = 10;
initPreAtkTime  = 10;

//CONTADORES PARA TIEMPOS DE ATAQUES
atkCooldown     = initCooldownAtk;
atkDuration     = 0;
preAtkDuration  = 0;
lastDirAtk		= 0;

//NOT USE YET
weight		= 10;
cooldownSpe	= 0;
grounded	= true;
/////////////////

#region Transitions
	chaseTransitions = ds_map_create();
	ds_map_add(
		chaseTransitions, 
		enemy_state.charge,
		function(_conditions){
			if(_conditions == undefined) return false;
			var inRange = abs(_conditions._dist) <= _conditions._range;
			return inRange && (_conditions._cooldown == 0)
		}
	);
	chargeTransitions = ds_map_create();
	ds_map_add(
		chargeTransitions, 
		enemy_state.attack,
		function(_conditions){
			if(_conditions == undefined) return false;
			return (_conditions._duration == 0)
		}
	);
	attackTransitions = ds_map_create();
	ds_map_add(
		attackTransitions, 
		enemy_state.chase,
		function (_conditions){
			if(_conditions == undefined) return false;
			return (_conditions._duration == 0)
		}
	);
	idleTransitions = ds_map_create();
	ds_map_add(
		idleTransitions, 
		enemy_state.chase,
		function (_conditions){
			return false
		}
	);
#endregion

#region States
	#region Chase state
	stateMachine.addState(new EnemyState(
		enemy_state.chase,
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
		},
		function (_exit_params){
			self.preAtkDuration = self.initPreAtkTime;
		},
		chaseTransitions
	));
	#endregion
	#region Charge state
	stateMachine.addState(new EnemyState(
		enemy_state.charge,
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
		chargeTransitions
	));
	#endregion
	#region Attack state
	stateMachine.addState(new EnemyState(
		enemy_state.attack,
		function (){},
		function (_parameters){
			if (!is_undefined(_parameters)) {
				scr_eny_basic_attack(
					"Attacks", 
					obj_eny_attack,
					_parameters._range, 
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
	#endregion
	#region Idle state
	stateMachine.addState(new EnemyState(
		enemy_state.idle,
		function (){},
		function (_parameters){},
		function (_exit_params){},
		idleTransitions
	));
	#endregion
#endregion
		
stateMachine.setInitialState(enemy_state.chase);
state = undefined;