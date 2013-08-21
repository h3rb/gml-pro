var pac_out,adjectives;
pac_out="";
adjectives=0;

// X

if ( adjectives < 1 and global.player_skill_tactics > 4 ) {
 pac_out+="Tactical ";
 adjectives+=1;
}

if ( adjectives < 1 and global.player_skill_survival > 4 ) {
 pac_out+="Rugged ";
 adjectives+=1;
}

if ( adjectives < 1 and global.player_skill_diplomacy > 4 ) {
 pac_out+="Diplomatic ";
 adjectives+=1;
}
if ( adjectives < 1 and global.player_skill_leadership > 6 ) {
 pac_out+="Commanding ";
 adjectives+=1;
} else
if ( adjectives < 1 and global.player_skill_leadership > 4 ) {
 pac_out+="Senior ";
 adjectives+=1;
} else 

// Y

if ( adjectives < 2 and global.player_skill_law > 5 ) {
 pac_out+="Legal ";
 adjectives+=1;
}

if ( adjectives < 2 and global.player_skill_athletics > 2 ) {
 pac_out+="Olympian ";
 adjectives+=1;
} else if ( adjectives < 2 and global.player_skill_athletics > 1 ) {
 pac_out+="Fit ";
 adjectives+=1;
}

if ( (adjectives < 3 and global.player_skill_computers > 2)
  or (adjectives < 2 and global.player_skill_computers > 1) ) {
 pac_out+="Technical ";
 adjectives+=1;
}

if ( adjectives <= 2 and global.player_skill_engineering > 2 ) {
 pac_out+="Design ";
 adjectives+=1;
}

if ( adjectives <= 2 and global.player_skill_botany > 2 ) {
 pac_out+="Botanical ";
 adjectives+=1;
}

// Z
if ( adjectives < 3 and global.player_skill_trade > 5 ) {
 pac_out+="Merchant ";
 adjectives+=1;
}

if ( adjectives < 3 and global.player_skill_astrophysics > 5 ) {
 pac_out+="Physicist ";
 adjectives+=1;
}

if ( adjectives < 4 and global.player_skill_medicine > 3 ) {
 pac_out+="Doctor ";
 adjectives+=1;
}

if ( adjectives < 4 and global.player_skill_mechanics > 3 ) {
 pac_out+="Machinist ";
 adjectives+=1;
}

if ( adjectives < 4 and global.player_skill_firearms > 5 ) {
 pac_out+="Sharpshooter ";
 adjectives+=1;
}

if ( adjectives < 4 and global.player_skill_sabotage > 3 ) {
 pac_out+="Saboteur ";
 adjectives+=1;
}

if ( adjectives < 4 and global.player_skill_survival > 4 ) {
 pac_out+="Survivalist ";
 adjectives+=1;
}

if ( adjectives < 4 and global.player_skill_astrogation > 4 ) {
 pac_out+="Navigator ";
 adjectives+=1;
}

if ( adjectives < 4 and global.player_skill_geology > 2 ) {
 pac_out+="Xeno-geologist ";
 adjectives+=1;
}

if ( adjectives < 4 and global.player_skill_archaeology > 2 ) {
 pac_out+="Xeno-archaeologist ";
 adjectives+=1;
}

if ( adjectives < 4 and global.player_skill_biology > 5 ) {
 pac_out+="Xeno-biologist ";
 adjectives+=1;
}

if ( adjectives < 4 and global.player_skill_tactics > 3 ) {
 pac_out+="Strategist ";
 adjectives+=1;
}

// Luck factor

if ( global.player_skill_luck > 2 ) {
 pac_add=pac_out;
 pac_out="Lucky "+pac_add;
}

return pac_out;
