shader_set(gles_TV);
texture_set_stage(global.gles_TV_tex0,argument0);
shader_set_uniform_f(global.gles_TV_time,argument1);
shader_set_uniform_f(global.gles_TV_position,argument2,argument3);
shader_set_uniform_f(global.gles_TV_resolution,argument4,argument5);
shader_set_uniform_f(global.gles_TV_viewport,argument6,argument7);
shader_set_uniform_f(global.gles_TV_size,argument8);
