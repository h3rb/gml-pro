// global.framerate may vary, use 1/room_speed where applicable
global.framerate=1/60; // usually this...
// Get resolution
global.width=display_get_width();
global.height=display_get_height();
// Center of this resolution
global.cx=global.width/2;
global.cy=global.height/2;
// Get DPI
global.dpi_x=display_get_dpi_x();
global.dpi_y=display_get_dpi_y();
// Get orientation
global.orientation=display_get_orientation();

init_audio();
init_surfaces();
init_shaders();
init_arrays();
init_tweens();

// For Scripts
init_scripts();

//Models
CubeMappedSphere();

// Set cursor
//init_hud(); 

// Data
//init_databank();

// Manager systems
init_managers();

// For sprites
init_sprites();

// Saves
init_savegames();

// Load an existing "saves" index if available
//fio_loadindex();

// Global frame counter
global.frame_number=0;

// Textbox Focus
global.textbox_focused=noone;

// Status
global.status_object=noone;

// Player init
//reset_player();

// Load sounds at runtime


