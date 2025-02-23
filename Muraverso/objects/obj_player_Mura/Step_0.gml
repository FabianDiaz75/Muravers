var dashKey = keyboard_check_pressed(vk_shift);
var punch= keyboard_check_pressed(vk_space);
var spriteOffX  = sprite_xoffset;
var spriteOffY = sprite_yoffset;


movements(spriteOffX, spriteOffY);

if(damageDelayer==0) {dash(dashKey, hor, ver, dashTime, dashDelay, dashSpeed, oldSpeed, lastSpeed)}

scr_punch(punch);

scr_action(hor,ver);
