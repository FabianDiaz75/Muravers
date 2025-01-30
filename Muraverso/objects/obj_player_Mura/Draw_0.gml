draw_self();
/*var strSpr ="spr_"+ name + "_" + action;
show_debug_message(strSpr)
var inSpr =asset_get_index(strSpr);
draw_text(x,y,string(inSpr)+ " " +strSpr)*/
draw_text(x,y,string(sprActual)+" "+string(spd))
sprite_index=sprActual;
if (invincible) {
    image_alpha = (image_alpha == 1) ? 0.5 : 1; // Blinking effect
} else {
    image_alpha = 1; // Normal visibility
}