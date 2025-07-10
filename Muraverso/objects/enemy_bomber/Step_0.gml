//Check if enemy is still alive
if(hp<=0 && !dead) { 
	stateMachine.setState(enemy_state.hurt);
	preAtkDuration = initPreAtkTime /2;
	dead = true;
};

//Initialization of variables in the frame
var dir  = 0;
var dist = 0;

//Count down timers
atkCooldown    = max(atkCooldown - 1, 0);
atkDuration    = max(atkDuration - 1, 0);
preAtkDuration = max(preAtkDuration - 1, 0);

if (instance_exists(obj_player_Mura)) {
	//Check the direction and distance of the player
	dir  = point_direction(x, y, obj_player_Mura.x, obj_player_Mura.y);
	dist = point_distance(x, y, obj_player_Mura.x, obj_player_Mura.y);
} else {
	state = stateMachine.setState(enemy_state.idle);
}

//State Machine 
state = stateMachine.getState();

if(state != undefined){
	switch(state){
		case enemy_state.chase:
			stateMachine.setState(enemy_state.chase);
			stateMachine.update(
				{
					_spd:spd, 
					_range:stepRange, 
					_range_mtp:stepMultiplayer, 
					_dir:dir, 
					_dist:dist
				}, 
				[
					{
						_conditions:{
							_dist:dist, 
							_range:atkRange, 
							_cooldown:atkCooldown
						},
						_next_state: enemy_state.charge,
						_exit_params: undefined
					}
				]
			);
		break;
		case enemy_state.charge:
			stateMachine.setState(enemy_state.charge);
			stateMachine.update(
				{
					_spd:spd, 
					_range:stepRange, 
					_range_mtp:stepMultiplayer, 
					_dir:dir, 
					_dist:dist
				}, 
				[
					{
						_conditions:{
							_duration:preAtkDuration,
							_dist:dist
						},
						_next_state: enemy_state.attack,
						_exit_params: {
							_dir:dir,
							_dist:dist
						}
					}
				] 				
			);
		break;
		case enemy_state.attack:	
			stateMachine.setState(enemy_state.attack);
			stateMachine.update(
				{
					_range:atkRange, 
					_dmg:dmg, 
					_dmg_range:dmgRange, 
					_dir_atk:lastDirAtk
				}, 
				[
					{
						_conditions:{
							_duration:atkDuration
						},
						_next_state: enemy_state.chase,
						_exit_params: undefined
					}
				] 	 
			);
		break; 
		case enemy_state.hurt:
			stateMachine.update(
				{}, 
				[
					{
						_conditions:{
							_duration:preAtkDuration,
							_dist:dist
						},
						_next_state: enemy_state.die,
						_exit_params: {
							_dir:dir,
							_dist:dist
						}
					}
				] 				
			);
		break;
		case enemy_state.die:
			stateMachine.update(
				{
					_range:atkRange, 
					_dmg:dmg, 
					_dmg_range:dmgRange, 
					_dir_atk:lastDirAtk
				}, 
				[] 	 
			);
		break;
	}
}
