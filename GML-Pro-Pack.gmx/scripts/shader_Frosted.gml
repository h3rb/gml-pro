shader_set(gles_Frosted);
texture_set_stage(global.gles_Frosted_scene,argument0);
texture_set_stage(global.gles_Frosted_noise,argument1);
shader_set_uniform_f(global.gles_Frosted_freq,argument2);
shader_set_uniform_f(global.gles_Frosted_resolution,argument3,argument4);
shader_set_uniform_f(global.gles_Frosted_pixel,argument5,argument6);
