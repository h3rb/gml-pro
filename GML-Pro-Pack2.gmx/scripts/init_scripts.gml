// Delimiter for the string_split algorithm
global.d="[DELIM]";
// Delimiters for multi-dimensional string-struct operations.
global.d2="[DEL2]";
global.d3="[DEL3]";
global.d4="[DEL4]";
global.d5="[DEL5]";
global.d6="[DEL6]";
global.d7="[DEL7]";
global.d8="[DEL8]";
global.d9="[DEL9]";
// Salt for the encryption algorithm
global.salt="Woman, 80, swallows diamond at Fla. charity event . . . TAMPA, Fla. (AP) The idea behind the Tampa Women's Club charity event was simple. For $20, you could buy a flute of champagne and a chance to win a one-carat, $5,000 diamond.";
// rotate_point
global.script_rotate_point_x=0;
global.script_rotate_point_y=0;
// Global script array
global.script_array1[0]=0;
global.script_array2[0,0]=0;
// longest_line
global.script_split_lines[0]="";
init_datatables();
// For the GUI (g_add_to_gui)
global.semaphore="";
// for string_split, string_split2
global.script_string_split[0]="";
global.script_string_split2[0]="";
global.script_string_split3[0]="";
// for sa_dim function (string arrays)
global.script_sa_dim_x=0;
global.script_sa_dim_y=0;
// for st_vec2d
global.vec_x=0;
global.vec_y=1;
// get_point_on_line
global.script_get_point_x=0;
global.script_get_point_y=0;
// st_pointstack_get
global.script_pointstack_x=0;
global.script_pointstack_y=0;

// Game-specific scripts:

// export_ship_grid_profile
global.script_grid_array[0,0]=false;

// for storing instance ids when flipping between rooms,
// used by o_use_ship_computer so far
global.was_instances=0;
global.was_instance[0]=noone;
global.was_obj[0]=noone;
global.was_uid[0]=noone;
global.was_value[0]=0;
global.was_string[0]="";
global.was_name[0]="";
global.was_room[0]=noone;
global.was_semaphore[0]=0;

// for sending messages back from a menu system in another room to an object
global.instance_messages_send=false;
global.instance_messages_pending=0;
global.instance_message_room[0]=noone;
global.instance_message_uid[0]=noone;
global.instance_message_number[0]=0;
global.instance_message_type[0]=0;
global.instance_message_data[0]="";

// for the unique data id
global.uids=0;
global.ud[0]="";
global.uido=noone;

// a2d related
global.a2d_w=0;
global.a2d_h=0;
global.a2d[0,0]=0;
global.a2d_size=0;

// sbin related string/binary storage
global.bytes[0]=0;
global.ints[0]=0;
global.strings[0]=0;
global.reals[0]=0;
global.bools[0]=false;

global.surfbin_x=0;
global.surfbin_y=0;
global.surfbin_byte=0;  // subbyte counter
