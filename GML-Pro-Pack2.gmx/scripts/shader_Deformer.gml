shader_set(gles_Deformer);
texture_set_stage(global.gles_Deformer_tex0,argument0);
texture_set_stage(global.gles_Deformer_tex1,argument1);
shader_set_uniform_f(global.gles_Deformer_time, argument2 );
shader_set_uniform_f(global.gles_Deformer_rgbFactor, argument3,argument4,argument5 );
shader_set_uniform_f(global.gles_Deformer_mouse, argument6,argument7);
shader_set_uniform_f(global.gles_Deformer_position, argument8,argument9 );
shader_set_uniform_f(global.gles_Deformer_offset, argument10,argument11 );
shader_set_uniform_f(global.gles_Deformer_viewport, argument12, argument13 );
shader_set_uniform_f(global.gles_Deformer_resolution, argument14,argument15 );

