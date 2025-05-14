//var dir  = 0;
//var dist = 0;
//cooldown    = max(cooldown - 1, 0);

//if (instance_exists(obj_player_Mura)) {
//	//Calcular direccion y distancia de mura
//	dir  = point_direction(x, y, obj_player_Mura.x, obj_player_Mura.y);
//	dist = point_distance(x, y, obj_player_Mura.x, obj_player_Mura.y);
//}
//state = stateMachine.getState();
//if(state != undefined){
//	switch(state){
//		case enemy_state.chase:
//			image_blend = c_white;
//			stateMachine.setState(enemy_state.chase);
//			stateMachine.update(
//				{_x:1, _y:1}, 
//				{_dist:dist, _cooldown:cooldown},
//				enemy_state.idle
//			);
//		break;
//		case enemy_state.idle:
//			image_blend = c_gray;
//			stateMachine.setState(enemy_state.idle);
//			stateMachine.update(
//				{_x:1, _y:1},
//				{_dist:dist, _cooldown:cooldown},
//				enemy_state.chase
//			);
//		break;
//	}
//}
