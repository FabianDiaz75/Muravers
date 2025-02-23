// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function scr_sprite(){
switch (action) {
    case "run":
        sprite_index=sprRun;
        break;
	case "dash":
        sprite_index=sprDash;
        break;
	case "atack":
        sprite_index=sprAtack;
        break;
    default:
        sprite_index=sprIdle;
        break;
}
}