var i;
for ( i=0; i<global.savegames; i++ ) {
 rm(int(i));
}
rm("saves");
global.savegames=0;
