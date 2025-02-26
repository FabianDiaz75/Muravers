var dir  = 0;
var dist = 0;
atkCooldown    = max(atkCooldown - 1, 0);
atkDuration    = max(atkDuration - 1, 0);
preAtkDuration = max(preAtkDuration - 1, 0);

if (instance_exists(obj_player_Mura)) {
	//Calcular direccion y distancia de mura
	dir  = point_direction(x, y, obj_player_Mura.x, obj_player_Mura.y);
	dist = point_distance(x, y, obj_player_Mura.x, obj_player_Mura.y);
}

switch(state){
	case enemy_state.chase:
		scr_eny_chase_movement(spd, stepRange, stepMultiplayer, dir, dist);
		//Distancia de ataque valido
		var inRange = abs(dist) <= atkRange;
		if(inRange && (atkCooldown == 0)){
			state			= enemy_state.pre_attack;
			preAtkDuration  = initPreAtkTime;
		}
	break;
	case enemy_state.pre_attack:
		lastDirAtk	= dir //hacer que el ataque no siga al jugador
		//MODIFICAR IMAGE_BLEND CUANDO SE TENGAN LAS ANIMACIONES
		image_blend = c_ltgray;
		if(preAtkDuration == 0){
			state		= enemy_state.attack;
			atkDuration = initAtkTime;
			image_blend = c_white;
		}
	break;
	case enemy_state.attack:	
		scr_eny_basic_attack("Attacks", atkRange, dmg, dmgRange, dmgRange, lastDirAtk);
		atkCooldown = initCooldownAtk;
		if(atkDuration == 0){
			state		= enemy_state.chase;
			lastDirAtk	= 0;
		}
	break;
	case enemy_state.hurt:
	
	break;
	case enemy_state.die:
		instance_destroy();
	break;
}
if(hp==0) instance_destroy();