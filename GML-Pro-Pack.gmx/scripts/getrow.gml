var table_name,rindex,tindex;
table_name=argument0;
rindex=real(argument1);
tindex = table_index(table_name);
if ( tindex == -1 ) return global.d;
return global.table_data[tindex,rindex];
