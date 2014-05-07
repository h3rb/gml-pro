var table_name,rindex,field_name,value,tindex,findex;
table_name=argument0;
rindex=argument1;
field_name=argument2;
value=argument3;
if ( is_string(table_name) ) tindex = table_index(table_name);
else tindex=table_name;
if ( tindex != -1 ) {
 if ( is_string(field_name) ) findex = field_index(tindex,field_name);
 else findex=field_name;
 if ( findex != -1 ) {
  global.datavec[0]=tindex;
  global.datavec[1]=rindex;
  global.datavec[2]=findex;
  dvset(value);
 }
}
