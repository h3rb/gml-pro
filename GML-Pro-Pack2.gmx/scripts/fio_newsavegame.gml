global.savegamenames[global.savegames]=global.player_callsign;
fio_savegame(global.savegames);
global.savegames+=1;
fio_saveindex();
