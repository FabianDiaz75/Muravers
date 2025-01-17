var hor= keyboard_check(ord("D"))-keyboard_check(ord("A"))
var ver= keyboard_check(ord("S"))-keyboard_check(ord("W"))
var dashKey = keyboard_check_pressed(vk_shift);
var spriteOffX  = sprite_xoffset;
var spriteOffY = sprite_yoffset;

movements(hor, ver, spriteOffX, spriteOffY);
dash(dashKey, hor, ver, dashTime, dashDelay, dashSpeed, oldSpeed, lastSpeed);