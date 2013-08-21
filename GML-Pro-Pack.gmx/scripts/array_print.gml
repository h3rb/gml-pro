
//array_print(array)
//show_message's all the data in the array (usefull for debugging)
var test, arrayID;

arrayID = argument[0];
global.buff = "Dumping data in array with id\# "+string(arrayID)+"###Array#(#";
global.pad = "     ";

sym_print_climb(arrayID);

global.buff += ")";

//message_text_font("arial",9,c_white,0);
show_message(global.buff);

test = file_text_open_write("Array_print.txt");
global.buff=string_replace_all(global.buff,"#","
")
file_text_write_string(test,global.buff)
file_text_close(test);
