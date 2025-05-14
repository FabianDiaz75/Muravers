var move_x		= lengthdir_x(spd, dir);
var move_y		= lengthdir_y(spd, dir);
x += move_x;
y += move_y;
	
if(image_index == damageImage){
	damage = damageReal;
}else{
	damage = 0;
}

if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}