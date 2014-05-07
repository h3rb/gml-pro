var fname,total,in,count;
global.savegames=0;
fname=fn("saves");
if ( fexists("saves") ) {
 in=decrypt(file_as_string(fname));
 total=split(in);
 if ( total <= 1 ) {
 } else {
  count=real(global.script_string_split[0]);
  global.savegames=count;
  for ( i =0; i<count; i++ ) global.savegamenames[i]=global.script_string_split[i+1];
 }
}
