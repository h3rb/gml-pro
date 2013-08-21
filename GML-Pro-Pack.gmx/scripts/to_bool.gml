var value;
value=argument0;
if ( value == "on" || value == "yes" || value == "y" || value == "1" ) return true;
if ( value == "off" || value == "no" || value == "n" || value == "0" ) return false;
return -1;
