// stores cargo of all instances in space area in a temporary string for "rm_CPU"
var o;
o=argument0;
var idx;
idx=global.cargo_storing;
global.cargo_storing+=1;
global.cargo_storage[idx]=cargo_encode(idx);
global.cargo_storage_uid[idx]=o.uid;
global.cargo_stored_count+=1;
