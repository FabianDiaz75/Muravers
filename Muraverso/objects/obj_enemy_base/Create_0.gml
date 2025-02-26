hp			= 60;
def			= 0;
state		= enemy_state.chase;


spd				= random_range(0.5, 1.5 );
stepRange		= 32 * 5; //cambiar 32 por variable global que indique el ancho del mundo
stepMultiplayer = 1;

attack		= true;
atkRange	= obj_enemy_base.sprite_width;
dmg			= 1;
dmgRange	= 1;
initCooldownAtk	= 60;
initAtkTime     = 10;
initPreAtkTime  = 10;

//CONTADORES PARA TIEMPOS DE ATAQUES
atkDuration     = 0;
atkCooldown     = initCooldownAtk;
preAtkDuration  = 0;

lastDirAtk		= 0;

weight		= 10;

cooldownSpe	= 0;
grounded	= true;