// Game Settings

global.option_tilt_screen=true;

// Character
global.player_firstname="Markus";
global.player_lastname="Greene";
global.player_callsign="Avatar";

switch (global.savegames) {
 case 1: global.player_firstname="Katherine"; global.player_lastname="L'Odara"; global.player_callsign="Jackal"; break;
 case 2: global.player_firstname="Jay";       global.player_lastname="Renner"; global.player_callsign="Condor"; break;
 case 3: global.player_firstname="Sasha";     global.player_lastname="Jhirl"; global.player_callsign="Salako"; break;
 case 4: global.player_firstname="Elwood";    global.player_lastname="Jackson"; global.player_callsign="Birdman"; break;
 case 5: global.player_firstname="Kumiko"; global.player_lastname="Murakami"; global.player_callsign="Shackle"; break;
 case 6: global.player_firstname="Aadi"; global.player_lastname="Kapoor"; global.player_callsign="Needle"; break; 
 case 7: global.player_firstname="Christopher"; global.player_lastname="Wright"; global.player_callsign="Opus"; break; 
 default: case 0:
  global.player_firstname="Markus"; global.player_lastname="Greene"; global.player_callsign="Avatar";
 break;
}

// Character: Skill bonuses
global.player_skill_astrophysics=0; // -11
global.player_skill_computers=0;    // 1-1
global.player_skill_personnel=0;    // 1-1
global.player_skill_tactics=0;      // 11
global.player_skill_diplomacy=0;    // 1
global.player_skill_trade=0;        // 
global.player_skill_sabotage=0;     // 1
global.player_skill_biology=0;      //
global.player_skill_archaeology=0;  // 11
global.player_skill_athletics=0;    //
global.player_skill_engineering=0;  // 
global.player_skill_luck=0;         // 1
global.player_skill_botany=0;       //
global.player_skill_geology=0;
global.player_skill_mechanics=0;
global.player_skill_astrogation=0;  // -1
global.player_skill_engineering=0;
global.player_skill_law=0;
global.player_skill_medicine=0;
global.player_skill_firearms=0;
global.player_skill_survival=0;
global.player_skill_leadership=0;   // 1-1

total=sprite_get_number(s_cargo);
for ( i=0; i<total; i++ ) global.player_cargo[i]=0;
