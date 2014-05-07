shader_set(gles_DreamBlur);
texture_set_stage(global.gles_DreamBlur_sceneTex, argument0);
shader_set_uniform_f(global.gles_DreamBlurRGB_a, argument1);
shader_set_uniform_f(global.gles_DreamBlurRGB_b, argument2);
shader_set_uniform_f(global.gles_DreamBlurRGB_c, argument3);
shader_set_uniform_f(global.gles_DreamBlurRGB_d, argument4);
shader_set_uniform_f(global.gles_DreamBlurRGB_e, argument5);
shader_set_uniform_f(global.gles_DreamBlurRGB_f, argument6);
shader_set_uniform_f(global.gles_DreamBlurRGB_factor, argument7);
shader_set_uniform_f(global.gles_DreamBlurRGB_offset, argument8, argument9);

