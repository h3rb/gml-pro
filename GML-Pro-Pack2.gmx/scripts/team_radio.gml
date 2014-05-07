var we=argument0;
var they=argument1;
if ( argument2 != sfx_empty ) {
 if ( we.team == they.team ) {
 radio_push(
  argument2, // audio sample
  we.name,
  argument3, // content 'This is what is said'
  c_lime,
  c_green,
  we.sprite,
  argument4,
  0,
  0,
  argument5 // duration in seconds
 );
 } else {
 radio_push(
  argument2, // audio sample
  we.name,
  argument3, // content 'This is what is said'
  c_orange,
  make_color_rgb(96,0,0),
  we.sprite,
  argument4,
  0,
  0,
  argument5 // duration in seconds
 );
 }
}
