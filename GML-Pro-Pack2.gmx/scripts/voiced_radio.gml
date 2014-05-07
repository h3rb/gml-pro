var voice=argument0;
global.voice_effect=sfx_empty;
global.voice_string=" . . . ";
switch ( argument0 ) {
 case 0:
   global.voice_effect=argument1;
   global.voice_duration=argument2;
   global.voice_string=argument3;
  break;
 case 1:
   global.voice_effect=argument4;
   global.voice_duration=argument5;
   global.voice_string=argument6;
  break;
 case 2:
   global.voice_effect=argument7;
   global.voice_duration=argument8;
   global.voice_string=argument9;
  break;
 case 3:
   global.voice_effect=argument10;
   global.voice_duration=argument11;
   global.voice_string=argument12;
  break;
}
