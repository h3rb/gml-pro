var tindex,rindex,i;
tindex=table_index(argument[0]);
if ( tindex == -1 ) return -1;
rindex=global.table_rows[tindex];
global.table_rows[tindex]+=1;
global.table_data[tindex,rindex]=int(rindex)+global.d;
if ( argument_count > 1 ) {
 for ( i=1; i<argument_count; i++ ) {
  if ( is_string(argument[i]) ) global.table_data[tindex,rindex]+=argument[i]+global.d;
  else if ( has_decimal(argument[i]) ) global.table_data[tindex,rindex]+=float(argument[i])+global.d;
  else global.table_data[tindex,rindex]+=int(argument[i])+global.d;
 }
}
return rindex;
