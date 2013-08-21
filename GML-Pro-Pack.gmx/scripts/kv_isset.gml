if ( argument_count == 1 ) return (string_length(kv_get(argument[0]))==0);
else if ( argument_count == 2 ) return (string_length(kv_get(argument[0],argument[1])));
