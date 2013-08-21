shader_set(gles_Motion);
texture_set_stage(global.gles_Motion_tex0,argument0);
texture_set_stage(global.gles_Motion_tex1,argument1);
shader_set_uniform_f(global.gles_Motion_time,argument2);
shader_set_uniform_f(global.gles_Motion_position,argument3,argument4);
shader_set_uniform_f(global.gles_Motion_resolution,argument5,argument6);
shader_set_uniform_f(global.gles_Motion_viewport,argument7,argument8);


