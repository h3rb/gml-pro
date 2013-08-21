var o;
o=argument0;

var i;
i=o.hangers;
o.hanger_x[i]=argument1;
o.hanger_y[i]=argument2;
o.hanger_launchrate[i]=argument3;
o.hanger_launchangle[i]=argument4;
o.fighter_tint[i]=argument5;
o.fighter_tintb[i]=argument6;
o.fighter_minscale[i]=argument7;
o.fighter_ai_type[i]=argument8;
o.fighter_payload=argument9;
if ( argument_count == 12 ) {
 o.hanger_types[i]=1;
 o.hanger_type1[i]=argument9;
 o.hanger_scale1[i]=argument10;
 o.hanger_type2[i]=0;
 o.hanger_scale2[i]=0;
 o.hanger_type3[i]=0;
 o.hanger_scale3[i]=0;
} else if ( argument_count == 14 ) {
 o.hanger_types[i]=2;
 o.hanger_type1[i]=argument9;
 o.hanger_scale1[i]=argument10;
 o.hanger_type2[i]=argument11;
 o.hanger_scale2[i]=argument12;
 o.hanger_type3[i]=0;
 o.hanger_scale3[i]=0;
} else if ( argument_count == 16 ) {
 o.hanger_types[i]=3;
 o.hanger_type1[i]=argument10;
 o.hanger_scale1[i]=argument11;
 o.hanger_type2[i]=argument12;
 o.hanger_scale2[i]=argument13;
 o.hanger_type3[i]=argument14;
 o.hanger_scale3[i]=argument15;
}
else show_message("Error: ai_hanger_add() wrong number of args ("+int(argument_count)+")");
o.hanger_launches[i]=0;
o.hanger_landings[i]=0;
o.hanger_instant[i]=0;
o.hanger_can_launch[i]=true;
o.hangers+=1;

