// Inherit the parent event
event_inherited();
spd				= random_range(0.7, 2);
stepRange		= obj_enemy_base.sprite_width * 8;
stepMultiplayer = 0;

atkRange		= obj_enemy_base.sprite_width * 8;
atkSpd			= 5;
dmg				= 1;
dmgRange		= 1;
initCooldownAtk	= 100;
atkCooldown		= initCooldownAtk;
initAtkTime     = 1;
initPreAtkTime  = 100;


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
			scr_eny_long_attack(
				"Attacks", 
				obj_eny_long_attack,
				1, 
				_parameters._dmg, 
				_parameters._dmg_range, 
				_parameters._dmg_range, 
				_parameters._dir_atk,
				self.atkSpd
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
