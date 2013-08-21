global.system_names[0]="Life Support";
global.system_names[1]="Engines";
global.system_names[2]="Weapon Systems";
global.system_names[3]="Medical";
global.system_names[4]="Sensors";

// Ship grid profiles
global.ship_profiles=0;
global.ship_profile[0]="";
global.ship_profile_sprite[0]=0;
global.ship_profile_vec[0]="";

// Player
add_ship_profile(s_playership,8,8);
add_ship_profile(s_rocketship,4,4);

// Precursors
add_ship_profile(s_destroyed_hulk,32,32);

// UFSE Military and Deep Space
add_ship_profile(s_gun_platform,16,16);
add_ship_profile(s_starbase,32,32);
add_ship_profile(s_hydromine,16,16);

// Private (protected) citizen vessels
add_ship_profile(s_starliner,24,32);
add_ship_profile(s_starliner_rearpod,2,2);
add_ship_profile(s_lifeboat,2,3);

// Durrag (UFSE fleet)
add_ship_profile(s_durag_cruiser,8,12);
add_ship_profile(s_durag_bomber,8,8);
add_ship_profile(s_durag_multipurpose,4,4);
add_ship_profile(s_durag_assault,8,8);
add_ship_profile(s_durag_destroyer,8,12);
add_ship_profile(s_durag_freighter,14,14);
add_ship_profile(s_durag_infiltrator,10,10);
add_ship_profile(s_durag_skiff,18,12);
add_ship_profile(s_durag_support,8,8);
add_ship_profile(s_durag_spaceliner,16,16);

// UFSE Species Cruisers
add_ship_profile(s_kratek_cruiser,14,16);
add_ship_profile(s_phenokti_cruiser,14,16);
add_ship_profile(s_allindorna_cruiser,16,24);
add_ship_profile(s_menaling_tug,16,16);
add_ship_profile(s_chronodila_cruiser,16,16);

// VICE FCCS Refabs
add_ship_profile(s_military_skiff,14,18);

// Asteroid Bases
add_ship_profile(s_asterbase1,24,24);
add_ship_profile(s_asterbase2,24,24);
add_ship_profile(s_asterbase3,24,24);
add_ship_profile(s_asterbase4,24,24);
add_ship_profile(s_asterbase5,24,24);
add_ship_profile(s_asterbase6,24,24);
add_ship_profile(s_asterbase7,24,24);
add_ship_profile(s_asterbase8,24,24);
add_ship_profile(s_asterbase9,24,24);
add_ship_profile(s_asterbase10,24,24);

// Pilexu
add_ship_profile(s_pilexu,6,6);
add_ship_profile(s_pilexu_group,8,8);
add_ship_profile(s_pilexu_mass,12,12);
add_ship_profile(s_pilexu_supercolony,24,24);
add_ship_profile(s_pilexu_colony,12,12);
add_ship_profile(s_pilexu_metaplex,18,18);
add_ship_profile(s_pilexu_superplex,24,24);
add_ship_profile(s_pilexu_commune,12,12);
add_ship_profile(s_pilexu_colonyplex,16,16);

// Pirates
add_ship_profile(s_pirate1,16,16);
add_ship_profile(s_pirate2,8,8);
add_ship_profile(s_pirate3,8,12);
add_ship_profile(s_pirate4,12,12);

// Remnant Species
add_ship_profile(s_alvaki_exocraft,16,16);
add_ship_profile(s_thilon_prong,16,16);
add_ship_profile(s_ursae_organaut,16,16);
add_ship_profile(s_remnant_cruiser,16,16);

// Kiria-Hall
add_ship_profile(s_kiriahal,8,14);


// Starliner Window Placements
global.starliner_window_points=144;  // 12 x 12 grid

// Top left
global.starliner_x[0,0]=-157; global.starliner_y[0,0]=-265;
global.starliner_x[0,1]=-131; global.starliner_y[0,1]=-265;
global.starliner_x[0,2]=-104; global.starliner_y[0,2]=-265;
global.starliner_x[0,3]=-77;  global.starliner_y[0,3]=-265;
global.starliner_x[0,4]=-51;  global.starliner_y[0,4]=-265;
global.starliner_x[0,5]=-24;  global.starliner_y[0,5]=-265;

// Top Right
global.starliner_x[0,6]=13;   global.starliner_y[0,6]=-265;
global.starliner_x[0,7]=40;   global.starliner_y[0,7]=-265;
global.starliner_x[0,8]=66;   global.starliner_y[0,8]=-265;
global.starliner_x[0,9]=93;   global.starliner_y[0,9]=-265;
global.starliner_x[0,10]=120; global.starliner_y[0,10]=-265;
global.starliner_x[0,11]=146; global.starliner_y[0,11]=-265;

{
var j,k;
for ( j=1; j<12; j++ ) for ( k=0; k<12; k++ ) global.starliner_x[j,k]=global.starliner_x[0,k];
for ( k=0; k<12; k++ ) global.starliner_y[1, k]=global.starliner_y[0,k]+34;
for ( k=0; k<12; k++ ) global.starliner_y[2, k]=global.starliner_y[0,k]+60;
for ( k=0; k<12; k++ ) global.starliner_y[3, k]=global.starliner_y[0,k]+92;
for ( k=0; k<12; k++ ) global.starliner_y[4, k]=global.starliner_y[0,k]+118;
for ( k=0; k<12; k++ ) global.starliner_y[5, k]=global.starliner_y[0,k]+150;
for ( k=0; k<12; k++ ) global.starliner_y[6, k]=global.starliner_y[0,k]+178;
for ( k=0; k<12; k++ ) global.starliner_y[7, k]=global.starliner_y[0,k]+210;
for ( k=0; k<12; k++ ) global.starliner_y[8, k]=global.starliner_y[0,k]+422;
for ( k=0; k<12; k++ ) global.starliner_y[9, k]=global.starliner_y[0,k]+454;
for ( k=0; k<12; k++ ) global.starliner_y[10,k]=global.starliner_y[0,k]+480;
for ( k=0; k<12; k++ ) global.starliner_y[11,k]=global.starliner_y[0,k]+512;
}

// Script globals

// for find_nearest_ship_point
global.nearest_ship_x=0;
global.nearest_ship_y=0;

// Cargo storage/retrieval
init_cargo();
