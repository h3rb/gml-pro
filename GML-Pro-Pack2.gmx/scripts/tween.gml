// Uses modulo
var idx,index;
index = argument1*1024.0;
idx=index % 1024.0;
if ( idx < 0 ) idx=abs(idx);
return global.tweens[argument0,idx];
