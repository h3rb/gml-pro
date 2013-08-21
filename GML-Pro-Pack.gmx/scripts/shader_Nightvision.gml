shader_set(gles_Nightvision);
texture_set_stage(global.gles_Nightvision_tex0,argument0);
texture_set_stage(global.gles_Nightvision_noise,argument1);
texture_set_stage(global.gles_Nightvision_mask,argument2);
shader_set_uniform_f(global.gles_Nightvision_time,argument3);
shader_set_uniform_f(global.gles_Nightvision_lum,argument4);
shader_set_uniform_f(global.gles_Nightvision_amp,argument5);
shader_set_uniform_f(global.gles_Nightvision_color,argument6,argument7,argument8);

