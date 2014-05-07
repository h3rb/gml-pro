var tindex,i;
tindex=create_table(argument[0]);
if ( argument_count > 1 ) for ( i=1; i<argument_count; i++ ) add_field(tindex,argument[i]);
