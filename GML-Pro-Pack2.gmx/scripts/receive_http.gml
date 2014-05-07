if ( ds_map_find_value( async_load, "id" ) == global.master_list_http_got ) {
 if ( ds_map_find_value( async_load, "status" ) >= 0 ) { // Loaded
  global.master_list_received=true;
  global.master_list_raw=ds_map_find_value(async_load,"result");
  update_active_server_list();
 } else { // Failed to load master list
  global.master_list_received=false;
  global.master_list_raw="";
 }
}
