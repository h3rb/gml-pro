//used for array_print
var arrayID, currentVal, current, size, key, n;
arrayID = argument[0];


size = ds_map_size(arrayID);

current = ds_map_find_first(arrayID);
global.buff += global.pad+"["+string(current)+"] => ";

for(n=1; n<=size; n+=1) {

if (!ds_map_exists(global.arrayMap, string(arrayID)+'>'+string(current))) {
currentVal = ds_map_find_value(arrayID,current);
global.buff += string(currentVal)+"#";
} else {
currentVal = ds_map_find_value(global.arrayMap,string(arrayID)+'>'+string(current));
global.buff += "Array#"+global.pad+"(#";
global.pad += "     ";
sym_print_climb(currentVal);
global.pad = string_replace(global.pad,"     ","");
global.buff += global.pad+")#"
}
if (n != size) {
 current = ds_map_find_next(arrayID,current);
global.buff += global.pad+"["+string(current)+"] => ";
}
}


