
// array_get(array, key)

var keys, arrayID, n;
arrayID = argument[0];

for(n=1;n<=15;n+=1) {
	if (is_string(argument[n])) {
		keys[n-1] = argument[n];
	} else {
		if (argument[n] != 0) {
			keys[n-1] = argument[n];
		} else {
			totalKeys = n-1;
			break;
		}
	}
}

currMap = arrayID;
for(n=0;n<totalKeys;n+=1) {
	//if not last key
	if (n != (totalKeys-1)) {
		if (ds_map_exists(global.arrayMap, string(currMap)+'>'+string(keys[n]))) {
			currMap = ds_map_find_value(global.arrayMap, string(currMap)+'>'+string(keys[n]));
		} else {
			return false;
		}
	} else {
		//if last key
		//if set to an array (to have more children), return true
		if (ds_map_exists(global.arrayMap, string(currMap)+'>'+string(keys[n]))) {
			return true;
		}
		if (ds_map_exists(currMap,keys[n])) {
			return true;
		} else {
			return false;
		}
	}
}



