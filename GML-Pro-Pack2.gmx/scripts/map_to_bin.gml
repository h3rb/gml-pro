var out,l,i,j,fp;
fp=bin_open(argument0);
for ( l=0; l<10; l++ ) {
 for ( i=0; i<170; i++ ) {
  for ( j=0; j<170; j++ ) {
   bin_write_int(fp,global.map[l,i+j*global.map_w[l]]);
   bin_write_int(fp,global.mtileset[l,i+j*global.map_w[l]]);
   bin_write_int(fp,global.mcode[l,i+j*global.map_w[l]]);
   bin_write_color(fp,global.mcolor[l,i+j*global.map_w[l]]);
   bin_write_real100k(fp,global.malpha[l,i+j*global.map_w[l]]);
   bin_write_int(fp,global.mblend[l,i+j*global.map_w[l]]);
   bin_write_int(fp,global.mobj[l,i+j*global.map_w[l]]);
   bin_write_int(fp,global.mobj2[l,i+j*global.map_w[l]]);
   bin_write_int(fp,global.mlight[l,i+j*global.map_w[l]]);
   bin_write_color(fp,global.mlightc[l,i+j*global.map_w[l]]);
   //show_message(int(j)+"/"+int(global.map_h[l]));
  }
  //show_message(int(i)+"/"+int(global.map_w[l]));
 }
 //show_message(int(l));
}

//show_message("1");

bin_write_int(fp,global.map_lights);
for ( i=0; i<global.map_lights; i++ ) {
 bin_write_int(fp,global.map_light[i]);
 bin_write_color(fp,global.map_light_color[i]);
 bin_write_int(fp,global.map_light_tween[i]);
 bin_write_int(fp,global.map_light_x[i]);
 bin_write_int(fp,global.map_light_y[i]);
 bin_write_int(fp,global.map_light_type[i]);
}

//show_message("2");

bin_write_int(fp,global.map_objects);
for ( i=0; i<global.map_objects; i++ ) {
 bin_write_int(fp,global.map_object[i]);
 bin_write_int(fp,global.map_object_x[i]);
 bin_write_int(fp,global.map_object_y[i]);
}
bin_close(fp);
