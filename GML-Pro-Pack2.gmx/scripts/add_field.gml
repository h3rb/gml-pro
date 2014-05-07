var tindex,field_name;
tindex=real(argument0);
field_name=argument1;
if ( tindex != -1 ) {
 if ( field_index(tindex,field_name) == -1 ) { // no duplicate field names
  global.table_columns[tindex]+=field_name+global.d;
  return true;
 }
}
return false;
