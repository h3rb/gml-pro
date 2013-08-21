var soundid,pitch,volume,loops;
soundid=argument0;
pitch=argument1;
volume=argument2;
loops=argument3;
return audio_play_sound_at(soundid,0,0,0,global.falloff_ref_dist,global.falloff_max_dist,global.falloff_factor,loops,1);
