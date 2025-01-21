var dir = point_direction(x,y,other.x,other.y);
var len = lerp(2,0,point_distance(x,y,other.x,other.y)/max(abs(sprite_width),abs(sprite_height)))
other.x += lengthdir_x(len,dir)
other.y += lengthdir_y(len,dir)
x        += lengthdir_x(len,dir+90)
y        += lengthdir_y(len,dir+90)