
// array_destroy(array)

var arrayID;

arrayID = argument[0];

var current, currentVal, size, parentID, parentKey;

current = ds_map_find_first(global.arrayMap);
currentVal = ds_map_find_value(global.arrayMap, current);
if (currentVal == arrayID) {
	ds_map_delete(global.arrayMap,current);
	parentID = real( string_copy(current,1, string_pos(">",current)-1) );
	parentKey = string_replace( current, string_copy(current,1, string_pos(">",current)), "" );
	ds_map_delete(parentID,parentKey);
}
	
size = ds_map_size(global.arrayMap)-1;

repeat(size) {
	current = ds_map_find_next(global.arrayMap, current);
	currentVal = ds_map_find_value(global.arrayMap, current);
	if (currentVal == arrayID) {
		ds_map_delete(global.arrayMap,current);
		parentID = real( string_copy(current,1, string_pos(">",current)-1) );
		parentKey = string_replace( current, string_copy(current,1, string_pos(">",current)), "" );
		ds_map_delete(parentID,parentKey);
	}
}

sym_destroy_climb(arrayID);

