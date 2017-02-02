
var arrayID, copyID, currentVal, current, size, fromMap, newMap;

arrayID = argument[0];
copyID = argument[1];


size = ds_map_size(arrayID);

current = ds_map_find_first(arrayID);
currentVal = ds_map_find_value(arrayID,current);
ds_map_add(copyID,current,currentVal);

for(n=1; n<=size; n+=1) {

	if (ds_map_exists(global.arrayMap, string(arrayID)+'>'+string(current))) {
		fromMap = ds_map_find_value(global.arrayMap, string(arrayID)+'>'+string(current));
		newMap = ds_map_create();
		ds_map_add(global.arrayMap, string(copyID)+'>'+string(current), newMap);
		sym_copy_climb(fromMap, newMap);
	}
 	if (n != size) {
 		current = ds_map_find_next(arrayID,current);
		currentVal = ds_map_find_value(arrayID,current);
		ds_map_add(copyID,current,currentVal);
	}
}


