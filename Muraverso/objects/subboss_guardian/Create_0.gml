// Inherit the parent event
event_inherited();
hp				= 600;
spd				= 0.5;
dashSpd			= spd * 50
stepRange		= 1;
stepMultiplayer = 1;

dashRange		= room_width;
atkRange		= self.sprite_height;
atkSpd			= 5;
dmg				= 40;
dmgRange		= 1;
initCooldownAtk	= 120;
initAtkTime     = 20;
initPreAtkTime  = 50;
initDashTime	= 30;

//CONTADORES PARA TIEMPOS DE ATAQUES
atkCooldown     = initCooldownAtk;
dashDuration	= initDashTime;
atkDuration     = 0;
preAtkDuration  = 0;
lastDirAtk		= 0;

#region Transitions
	#region Walk Transition
		walkTransitions = ds_map_create();
		ds_map_add(
			walkTransitions, 
			enemy_state_guardian.dashh,
			function(_conditions){
				if(_conditions == undefined) return false;
				var inRange = abs(_conditions._dist) <= _conditions._range;
				return inRange && (_conditions._cooldown == 0)
			}
		);
	#endregion
	#region Dash Transition
		dashTransitions = ds_map_create();
		ds_map_add(
			dashTransitions, 
			enemy_state_guardian.charge,
			function(_conditions){
				if(_conditions == undefined) return false;
				var inRange = abs(_conditions._dist) <= _conditions._range;
				return inRange || (_conditions._cooldown == 0)
			}
		);
	#endregion
	#region Charge Transition
		chargeTransitions = ds_map_create();
		ds_map_add(
			chargeTransitions, 
			enemy_state_guardian.attack,
			function (_conditions){
				if(_conditions == undefined) return false;
				return (_conditions._duration == 0)
			}
		);
	#endregion
	#region Attack Transition
		attackTransitions = ds_map_create();
		ds_map_add(
			attackTransitions, 
			enemy_state_guardian.walk,
			function (_conditions){
				if(_conditions == undefined) return false;
				return (_conditions._duration == 0)
			}
		);
	#endregion
#endregion

#region States
	#region Walk state
		stateMachine.addState(new EnemyState(
			enemy_state_guardian.walk,
			function (){},
			function (_parameters){
				if (!is_undefined(_parameters)) {
					if(
						!place_meeting(self.x + _parameters._spd, self.y, obj_wall) &&
						!place_meeting(self.x - _parameters._spd, self.y, obj_wall) &&
						!place_meeting(self.x, self.y + _parameters._spd, obj_wall) &&
						!place_meeting(self.x, self.y - _parameters._spd, obj_wall)
					){
						scr_eny_chase_movement(
							_parameters._spd, _parameters._range, _parameters._range_mtp, 
							_parameters._dir, _parameters._dist
						);
					}
				} else {
					show_debug_message("Error: _parameters is undefined");
				}
			},
			function (_exit_params){
				if(_exit_params != undefined){
					self.lastDirAtk	 = _exit_params._dir;
					self.dashDuration = self.initDashTime;
				}
			},
			walkTransitions
		));
	#endregion
	#region Dash state
		stateMachine.addState(new EnemyState(
			enemy_state_guardian.dashh,
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
				self.preAtkDuration = self.initPreAtkTime;
			},
			dashTransitions
		));
	#endregion
	#region Charge state
		stateMachine.addState(new EnemyState(
			enemy_state_guardian.charge,
			function (){},
			function (_parameters){
				self.image_blend = c_gray;
			},
			function (){
				self.atkDuration = self.initAtkTime;
				self.image_blend = c_white;
			},
			chargeTransitions
		));
	#endregion
	#region Attack state
	stateMachine.addState(new EnemyState(
		enemy_state_guardian .attack,
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
		enemy_state_guardian.idle,
		function (){},
		function (_parameters){},
		function (_exit_params){},
		ds_map_create()
	));
	#endregion
#endregion
		
stateMachine.setInitialState(enemy_state_guardian.walk);
state = undefined;