// Read a message from the incoming client's buffer and store it.
// Prior to this, we looked at the buffer and read the first
// byte of the buffer which is passed as waiting_for.
// Args: client_id, waiting_for (expected type / format of message),
//       result of buffer_read() that type.

//
// Maps: Waiting for   to  Message Type
var client_id,waiting_for,parameter;

client_id=argument0;
waiting_for=argument1;
parameter=argument2;

var i;
i=global.client_messages[client_id];

if ( waiting_for == 0 ) { } else // ignore content of packet
if ( waiting_for == 1 ) { // string 
 global.client_message_type[client_id,i]=1;
 global.client_message_string[client_id,i]=parameter;
 global.client_message_real[client_id,i]=0;
 global.client_message_key[client_id,i]=0;
 global.client_message_bool[client_id,i]=false; 
 global.client_message_x[client_id,i]=0;
 global.client_message_y[client_id,i]=0;
 global.client_messages[client_id]+=1;
} else if ( waiting_for == 2 ) { // signed int32 (real)
 global.client_message_type[client_id,i]=2;
 global.client_message_string[client_id,i]="";
 global.client_message_real[client_id,i]=parameter;
 global.client_message_key[client_id,i]=0;
 global.client_message_bool[client_id,i]=false; 
 global.client_message_x[client_id,i]=0;
 global.client_message_y[client_id,i]=0;
 global.client_messages[client_id]+=1;
} else if ( waiting_for == 3 ) { // signed float32 (real)
 global.client_message_type[client_id,i]=2;
 global.client_message_string[client_id,i]="";
 global.client_message_real[client_id,i]=parameter;
 global.client_message_key[client_id,i]=0;
 global.client_message_bool[client_id,i]=false; 
 global.client_message_x[client_id,i]=0;
 global.client_message_y[client_id,i]=0;
 global.client_messages[client_id]+=1;
} else if ( waiting_for == 4 ) { // key + pressed/unpressed
 global.client_message_type[client_id,i]=2;
 global.client_message_string[client_id,i]="";
 global.client_message_real[client_id,i]=0;
 global.client_message_key[client_id,i]=buffer_read(parameter,buffer_u8);
 global.client_message_x[client_id,i]=0;
 global.client_message_y[client_id,i]=0;
 var value;
 value=buffer_read(parameter,buffer_u8);
 if ( value == 0 ) global.client_message_bool[client_id,i]=false; 
 else  global.client_message_bool[client_id,i]=true;
 global.client_messages[client_id]+=1;
} else if ( waiting_for == 5 ) { // boolean value
 global.client_message_type[client_id,i]=4;
 global.client_message_string[client_id,i]="";
 global.client_message_real[client_id,i]=0;
 global.client_message_key[client_id,i]=0;
 global.client_message_x[client_id,i]=0;
 global.client_message_y[client_id,i]=0;
 global.client_message_bool[client_id,i]=parameter;
 global.client_messages[client_id]+=1;
} else if ( waiting_for == 6 ) { // xy
 global.client_message_type[client_id,i]=5;
 global.client_message_string[client_id,i]="";
 global.client_message_real[client_id,i]=0;
 global.client_message_key[client_id,i]=0;
 global.client_message_x[client_id,i]=buffer_read(parameter,buffer_f32);
 global.client_message_y[client_id,i]=buffer_read(parameter,buffer_f32);
 global.client_message_bool[client_id,i]=0;
 global.client_messages[client_id]+=1;
}
