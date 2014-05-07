var tindex,field_name,total,i;
tindex=argument0;
field_name=argument1;
total=split(global.table_columns[tindex]);
for ( i=0; i<total; i++ ) {
 if ( compared(global.script_string_split[i],field_name) ) return i;
}
return -1;
