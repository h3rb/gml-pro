var a,b,nearness;
a = argument0;
b = argument1;
nearness = argument3;
if ( (a-nearness) < b && (a+nearness) > b ) return true;
return false;
