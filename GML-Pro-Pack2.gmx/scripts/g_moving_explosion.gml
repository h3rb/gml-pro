var tx,ty,sprite,color,framespeed,scale,o;
tx=argument0;
ty=argument1;
sprite=argument2;
color=argument3;
framespeed=argument4;
scale=argument5;

o=instance_create(tx,ty,o_g_moving_explosion);
o.sprite=sprite;
o.length=sprite_get_number(sprite);
o.color=color;
o.frame=0;
o.framespeed=framespeed;
o.scale=scale;
//show_message("g_explosion frame/length: "+int(o.frame)+"/"+int(o.length));
return o;
