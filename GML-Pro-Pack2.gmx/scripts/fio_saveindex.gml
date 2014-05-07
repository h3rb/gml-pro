var fname,file,out;
fname=fn("saves");
file=file_text_open_write(fname);
out=float(global.savegames)+global.d;
for ( i=0; i<global.savegames; i++ ) out+=global.savegamenames[i]+global.d;
string_as_file(encrypt(out),fname);
