scr_sprite();
draw_sprite_ext(sprite_index,image_index,x,y,lastSpeed[0],1,0,c_white,alpha);
/*var strSpr ="spr_"+ name + "_" + action;
show_debug_message(strSpr)
var inSpr =asset_get_index(strSpr);
draw_text(x,y,string(inSpr)+ " " +strSpr)*/
draw_text(x,y,string(hor)+" "+string(ver))
if (invincible) {
    alpha = (alpha == 1) ? 0.5 : 1; // Blinking effect
} else {
    alpha = 1; // Normal visibility
}