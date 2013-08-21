var o;
o=argument0;
// Target Selection
if ( o.destination != noone ) { 
 if ( instance_exists(o.destination) ) {
  o.omoving_to_x=o.destination.x;
  o.omoving_to_y=o.destination.y;
 }
}
o.destination=ai_FindNavPointTouring(o);
o.course_plot_attempts+=1;
