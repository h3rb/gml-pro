// triggers a launch of a wave of fighters from all available hangers
var o;
o=argument0;

var i;
for (i=0; i<o.hangers; i++ ) {
 if ( o.fighter_launches[i] < o.fighter_payload[i] ) {
  if ( o.hanger_instant[i] == 0.0 ) {
   o.fighter_launches[i]+=1;
   o.hanger_instant[i]=o.hanger_launchrate[i];
   rotate_point(-degtorad(o.image_angle),o.hanger_x[i],o.hanger_y[i]);
   global.script_rotate_point_x+=o.x;
   global.script_rotate_point_y+=o.y;
   var f;
   f=instance_create(o.x,o.y,o_ai_fighter);
   var t;
   t=real(int(random(o.hanger_types[i])));
   if ( t == 0 ) {
    f.final_scale=o.hanger_scale1[i];
    f.sub=o.hanger_type1[i];
   } else if ( t == 1 ) {
    f.final_scale=o.hanger_scale2[i];
    f.sub=o.hanger_type2[i];
   } else {
    f.final_scale=o.hanger_scale3[i];
    f.sub=o.hanger_type3[i];
   }
   f.start_scale=o.hanger_minscale[i];
   f.ai_type=o.fighter_ai_type[i];
   f.tint=o.fighter_tint[i];
   f.direction=o.direction+o.hanger_launchangle[i];
   get_fighter_stats(f);
  }
 }
}
