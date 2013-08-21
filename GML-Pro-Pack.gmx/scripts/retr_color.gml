var s;
if ( argument_count == 1 ) {
 s=string_split4(argument0,global.d);
} else s=string_split4(argument0,argument1);
return
 make_color_rgb(
  real(global.script_string_split4[0]),
  real(global.script_string_split4[1]),
  real(global.script_string_split4[2])
 );
