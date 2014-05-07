//array_copy(array)
arrayID = argument[0];
copyID = ds_map_create();
sym_copy_climb(arrayID, copyID);
return copyID;
