
var arrayID, current, size, mapKey;

arrayID = argument[0];

size = ds_map_size(arrayID);

current = ds_map_find_first(arrayID);
mapKey = string(arrayID)+'>'+string(current);

repeat(size) {
	if (ds_map_exists(global.arrayMap, mapKey)) {
		sym_destroy_climb( ds_map_find_value(global.arrayMap,mapKey) );
		ds_map_delete(global.arrayMap,mapKey);
	}
 	current = ds_map_find_next(arrayID, current);
	mapKey = string(arrayID)+'>'+string(current);
}

ds_map_destroy(arrayID);


