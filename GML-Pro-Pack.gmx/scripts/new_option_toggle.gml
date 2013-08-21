var o;
o=instance_create(argument[0],argument[1],o_option_toggle);
o.index=argument[3];
if ( argument_count > 5 ) {
 set_game_option(o,argument[3],argument[4],argument[5],argument[6]);
} else {
 set_game_option(o,argument[3],argument[4],argument[5]);
}
return o;
