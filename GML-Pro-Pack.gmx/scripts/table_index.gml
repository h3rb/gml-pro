var match,i;
match=argument0;
for ( i=0; i<global.tables; i++ ) {
 if ( compared(global.table_names[i],match) ) return i; 
}
return -1;
