var o,ecks,why,a,wtype,wmounttype;

o=argument[0];
ecks=argument[1];
why=argument[2];
a=argument[3];
vel=argument[4];
wtype=argument[5];
if ( argument_count > 6 ) wmounttype=argument[6];
else wmounttype=-1;

var b;
//if ( wtype == 3 ) {
//} else {
 b=instance_create(
  ecks,why,
  o_weapon1 // generic weapon object
 );
 if ( argument_count == 6 ) weapon_set_profile(b,wtype);
 else weapon_set_profile(b,wtype,wmounttype);
 b.direction=a;
 b.velocity+=vel;//o.velocity;//mount_speed[i];
 b.shot_by=o.id;
//}

//generate_burst(b); is called later, not here! (recursion)

return b;
