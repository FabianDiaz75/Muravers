var dashKey = keyboard_check_pressed(vk_shift);
var punch= keyboard_check_pressed(vk_space);
if(damageDelayer==0) {dash(dashKey, hor, ver, dashTime, dashDelay, dashSpeed, oldSpeed, lastSpeed)}

scr_punch(punch);
movements();


scr_action(hor,ver);
