var tx,ty,sprite,color,framespeed,scale,o;
tx=argument[0];
ty=argument[1];
sprite=argument[2];
color=argument[3];
framespeed=argument[4];
if ( argument_count > 4 ) {
 scale=argument[5];
} else {
 scale=1.0;
}
o=instance_create(tx,ty,o_g_explosion);
o.sprite=sprite;
o.length=sprite_get_number(sprite);
o.color=color;
o.frame=0;
o.framespeed=framespeed;
o.scale=scale;
//show_message("g_explosion frame/length: "+int(o.frame)+"/"+int(o.length));
return o;
