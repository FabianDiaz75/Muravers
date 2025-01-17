var hor= keyboard_check(ord("D"))-keyboard_check(ord("A"))
var ver= keyboard_check(ord("S"))-keyboard_check(ord("W"))
var dashKey = keyboard_check_pressed(vk_shift);

movements(hor, ver);
dash(dashKey, hor, ver, dashTime, dashDelay, dashSpeed, oldSpeed);