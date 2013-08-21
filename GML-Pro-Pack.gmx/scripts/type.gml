var table_name,field_name,note,tindex,findex;
// notates a column
table_name=argument0;
field_name=argument1;
note=argument2;
tindex=table_index(table_name);
if ( tindex == -1 ) return global.d;
findex=field_index(tindex,field_name);
if ( findex == -1 ) return global.d;
return global.table_notes[tindex,findex];
