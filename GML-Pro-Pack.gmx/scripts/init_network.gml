// Self Identification
global.whatismyip = "http://lostastronaut.com/io.php?ip";
global.whatismyip_http_got=0;

// Master List Data
global.server_list_base_url = "http://lostastronaut.com/io.php";
global.servers_in_list=0;           // How big is our current list?
global.server_listed_ip[0]="";      // Remote IP
global.server_listed_port_udp[0]=0; // UDP Port
global.server_listed_port_tcp[0]=0; // TCP Port
global.server_listed_x[0]=0;        // "World" X position
global.server_listed_y[0]=0;        // "World" Y position
global.server_listed_last[0]="";    // ???

global.master_list_http_got=0;      // http_got returned value
global.master_list_raw="";          // Raw data (http result)
global.master_list_received=false;  // Was it received?

global.master_list_delay=60.0;      // How long between master list identifications
global.master_list_instant=0.0;     // ...

global.client_limit= 32; //24;18;12;8;4    // Max connections
global.client_limit/=2;  // Divide by two when using both UDP and TCP.

global.client_attempt_connect_delay=30.0;
global.client_attempt_connect_instant=0.0;

// Local UDP/TCP Server Settings
global.local_name     = "";
global.local_port_tcp = 6510;
global.local_port_udp = 6511;

global.broadcast_x=0;
global.broadcast_y=0;

global.server_tcp = network_create_server( network_socket_tcp, global.local_port_tcp, global.client_limit );
global.server_udp = network_create_server( network_socket_udp, global.local_port_udp, global.client_limit );

global.client_list = ds_map_create();

// Debug Output
global.display_string="init complete";
global.url=""; // Used to track simplex http

// Outgoing profiles

global.remotes = 0;                 // Active remote connections to clients
global.remote_ip[0]="127.0.0.1";    // IP of remote client
global.remote_port_tcp[0]=6510;     // TCP Port
global.remote_port_udp[0]=6511;     // UDP Port
global.client_name[0]="";           // An identifying client name
global.client_tcp[0]=-1;            // TCP Port
global.client_udp[0]=-1;            // UDP Port
global.client_tcp_waiting_for[0]=0; // code for message awaiting state (see server_receive)
global.client_udp_waiting_for[0]=0; // code for message awaiting state (see server_receive)

// Outgoing network queue (per client)
global.network_outgoing[0]=0;

// Messages received from clients.
global.client_messages[0]=0;
global.client_message_type[0,0]=0;
global.client_message_real[0,0]=0;
global.client_message_string[0,0]="";
global.client_message_key[0,0]=0;
global.client_message_bool[0,0]=0;
global.client_message_x[0,0]=0;
global.client_message_y[0,0]=0;

sending=0;

// IP / friend memory

global.ips_remembered=0;       // count
global.ip_remembered[0]="";    // Ip address
global.ip_udp[0]=0;            // last known port
global.ip_tcp[0]=0;            // last known tcp
global.ip_last_seen[0]=0;      // time stamp of last interaction
global.ip_friendly_name[0]=""; // The player's outward facing name or moniker
global.ip_favorite[0]="";      // Is saved and reloaded

