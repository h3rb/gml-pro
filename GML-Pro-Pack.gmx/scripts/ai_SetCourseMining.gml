var o;
o=argument0;
// Target Selection
o.destination=ai_FindNavPointMining(o.id,room_width);
if ( o.destination != noone and instance_exists(o.destination) ) {
 o.moving_to_x=o.destination.x;
 o.moving_to_y=o.destination.y;
}
o.course_plot_attempts+=1;
