shader_set(gles_DotBloom);
texture_set_stage(global.gles_DotBloom_tex0,argument0);
shader_set_uniform_f(global.gles_DotBloom_TexSize,argument1,argument2);
shader_set_uniform_f(global.gles_DotBloom_InSize,argument3,argument4);
shader_set_uniform_f(global.gles_DotBloom_OutSize,argument5,argument6);
shader_set_uniform_f(global.gles_DotBloom_gamma,argument7);
shader_set_uniform_f(global.gles_DotBloom_shine,argument8);
shader_set_uniform_f(global.gles_DotBloom_blend,argument9);

