shader_set(gles_Pulse);
texture_set_stage(global.gles_Pulse_tex0, argument0);
shader_set_uniform_f(global.gles_Pulse_time, argument1);
shader_set_uniform_f(global.gles_Pulse_resolution, argument2, argument3 );
shader_set_uniform_f(global.gles_Pulse_viewport, argument4, argument5 );
shader_set_uniform_f(global.gles_Pulse_position, argument6, argument7 );

