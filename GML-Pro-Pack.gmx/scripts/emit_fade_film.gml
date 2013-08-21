var o;
o=instance_create(argument1,argument2,FAF_FadeFilm);
o.sprite=argument0;
o.smallScale=argument3;
o.bigScale=argument4;
o.delay=argument5;
o.durationIn=argument6;
o.durationOut=argument7;
o.duration=argument8;
o.tint=argument9;
o.blend=argument10;
o.team=9999;
if ( argument_count > 11 ) {
 o.in=argument[11];
}
if ( argument_count > 12 ) {
 o.out=argument[12];
}
return o;
