
// array_set(array, value, key1, key2, key3...)
//LIMITATION: you can not pass 0 to this script. But you may pass "0" (string)

var keys, n, arrayID, currMap, totalKeys, keyStr, newMap;

for(n=2;n<=16;n+=1) {
if (is_string(argument[n])) {
keys[n-2] = argument[n];
} else {
if (argument[n] != 0) {
keys[n-2] = argument[n];
} else {
totalKeys = n-2;
break;
}
}
}

arrayID = argument[0];
value = argument[1];

currMap = arrayID;
for(n=0;n<totalKeys;n+=1) {
//if not last key
if (n != (totalKeys-1)) {
if (ds_map_exists(global.arrayMap, string(currMap)+'>'+string(keys[n]))) {
currMap = ds_map_find_value(global.arrayMap, string(currMap)+'>'+string(keys[n]));
} else {
newMap = ds_map_create();
keyStr = string(currMap)+'>'+string(keys[n]);
ds_map_add(global.arrayMap, keyStr, newMap);
//Set it to Array, so we don't have to loop through global.arrayMap on array_copy
if (ds_map_exists(currMap,keys[n])) {
ds_map_replace(currMap, keys[n], "Array")
} else {
ds_map_add(currMap, keys[n], "Array");
}

currMap = newMap;
}
} else {
//if last key
//if set to an array (to have more children), fix it
if (ds_map_exists(global.arrayMap, string(currMap)+'>'+string(keys[n]))) {
sym_destroy_climb( ds_map_find_value(global.arrayMap, string(currMap)+'>'+string(keys[n])) );
ds_map_delete(global.arrayMap, string(currMap)+'>'+string(keys[n]));
}
//replace value if it already exists, otherwise just add it
if (ds_map_exists(currMap,keys[n])) {
if is_string(keys[n]) if (keys[n] == "[]") {keys[n] = array_size(currMap);}
ds_map_replace(currMap, keys[n], value)
} else {
if is_string(keys[n]) if (keys[n] == "[]") {keys[n] = array_size(currMap)+1;}
ds_map_add(currMap, keys[n], value);
}
}
}


