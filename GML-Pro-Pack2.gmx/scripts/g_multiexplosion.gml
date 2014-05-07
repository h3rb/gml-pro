var tx,ty,sprite,color,framespeed,scale,sprite2,color2,framespeed2,scale2,interval,spread,sound,creep,o;
tx=argument0;
ty=argument1;

sprite=argument2;
color=argument3;
framespeed=argument4;
scale=argument5;

sprite2=argument6;
color2=argument7;
framespeed2=argument8;
scale2=argument9;

interval=argument10;
spread=argument11;
sound=argument12;
creep=argument13;

o=instance_create(tx,ty,o_g_multiexplosion);

o.sprite=sprite;
o.length=sprite_get_number(sprite);
o.color=color;
o.framespeed=framespeed;
o.scale=scale;

o.sprite2=sprite2;
o.scale2=scale2;
o.color2=color2;
o.framespeed2=color2;
o.interval=interval;

o.spread=spread;
o.sound=sound;
o.creep=creep;

//show_message("g_multiexplosion: length / framespeed: "+int(o.length)+"/"+float(o.framespeed));
return o;
