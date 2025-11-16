var dashKey  = keyboard_check_pressed(vk_shift);
var punchKey = keyboard_check(vk_space);
var horKey	 = keyboard_check(ord("D"))-keyboard_check(ord("A"))
var verKey	 = keyboard_check(ord("S"))-keyboard_check(ord("W"))
if(damageDelayer==0) {dash(dashKey, hor, ver, dashTime, dashDelay, dashSpeed, oldSpeed, lastSpeed)}

scr_punch(punchKey);
//show_debug_message(string(horKey)+" "+string(verKey))
movements();


scr_action(hor,ver);
