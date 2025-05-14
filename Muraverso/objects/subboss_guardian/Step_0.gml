//Check if enemy is still alive
if(hp==0) instance_destroy();

//Initialization of variables in the frame
var dir  = 0;
var dist = 0;

//Count down timers
atkCooldown    = max(atkCooldown - 1, 0);
atkDuration    = max(atkDuration - 1, 0);
preAtkDuration = max(preAtkDuration - 1, 0);
dashDuration   = max(dashDuration - 1, 0);

if (instance_exists(obj_player_Mura)) {
	//Check the direction and distance of the player
	dir  = point_direction(x, y, obj_player_Mura.x, obj_player_Mura.y);
	dist = point_distance(x, y, obj_player_Mura.x, obj_player_Mura.y);
} else {
	state = stateMachine.setState(enemy_state_guardian.idle);
}

//State Machine 
state = stateMachine.getState();
if(state != undefined){
	switch(state){
		#region Walk State
		case enemy_state_guardian.walk:
			stateMachine.setState(enemy_state_guardian.walk);
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
							_range:dashRange, 
							_cooldown:atkCooldown
						},
						_next_state: enemy_state_guardian.dashh,
						_exit_params: {
							_dir:dir
						}
					}
				]
			);
		break;
		#endregion
		#region Dash State
		case enemy_state_guardian.dashh:
			stateMachine.setState(enemy_state_guardian.dashh);
			stateMachine.update(
				{
					_spd:dashSpd, 
					_range:stepRange, 
					_range_mtp:stepMultiplayer, 
					_dir:lastDirAtk, 
					_dist:dist
				}, 
				[
					{
						_conditions:{
							_dist:dist, 
							_range:atkRange,
							_cooldown:dashDuration
						},
						_next_state: enemy_state_guardian.charge,
						_exit_params: {
							_dir:dir
						}
					}
				]
			);
		break;
		#endregion
		#region Charge State
		case enemy_state_guardian.charge:
			stateMachine.setState(enemy_state_guardian.charge);
			stateMachine.update(
				{}, 
				[
					{
						_conditions:{
							_duration:preAtkDuration,
							_dist:dist
						},
						_next_state: enemy_state_guardian.attack,
						_exit_params: undefined
					}
				] 				
			);
		break;
		#endregion
		#region Attack State
		case enemy_state_guardian.attack:
			stateMachine.setState(enemy_state_guardian.attack);
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
						_next_state: enemy_state_guardian.walk,
						_exit_params: undefined
					}
				] 	 
			);
		break;
		#endregion
	}
}