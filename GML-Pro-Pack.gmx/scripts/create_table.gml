var tindex,i;
// Defines a table of <name>
tindex=global.tables;
global.table_names[tindex]=argument0;
global.table_columns[tindex]="";
for ( i=1; i<argument_count; i++ ) global.table_columns[tindex]+=argument[i]+global.d;
global.table_data[tindex,0]="";
global.table_rows[tindex]=0;
global.tables+=1;
return tindex;
