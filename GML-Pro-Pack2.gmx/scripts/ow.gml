var tindex,rindex,i;
// For tables wider than 4 columns, lets you add more data (up to 5 columns) to the previously added row..
tindex=global.datavec[0];
rindex=global.datavec[1];
for ( i=0; i<argument_count; i++ )
 if ( is_string(argument[i]) ) global.table_data[tindex,rindex]+=argument[i]+global.d;
 else if ( has_decimal(argument[i]) ) global.table_data[tindex,rindex]+=float(argument[i])+global.d;
 else global.table_data[tindex,rindex]+=int(argument[i])+global.d;


