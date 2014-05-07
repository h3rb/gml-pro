/*
 * Image Processing (2D)
 */
 
/** Alpha **/

// Alpha Average Threshold
global.gles_AlphaAvgThreshold_tex0 = shader_get_sampler_index(gles_AlphaAvgThreshold,"tex0");
global.gles_AlphaAvgThreshold_threshold = shader_get_uniform(gles_AlphaAvgThreshold,"threshold");

// Alpha Average
global.gles_AlphaAvg_tex0 = shader_get_sampler_index(gles_AlphaAvg,"tex0");

// Alpha0
global.gles_Alpha0_tex0 = shader_get_sampler_index(gles_Alpha0,"tex0");
global.gles_Alpha0_tex1 = shader_get_sampler_index(gles_Alpha0,"tex1");

// AlphaInv
global.gles_AlphaInv_tex0 = shader_get_sampler_index(gles_AlphaInv,"tex0");
global.gles_AlphaInv_tex1 = shader_get_sampler_index(gles_AlphaInv,"tex1");

// MaskAlpha
global.gles_MaskAlpha_tex0 = shader_get_sampler_index(gles_MaskAlpha,"tex0");
global.gles_MaskAlpha_tex1 = shader_get_sampler_index(gles_MaskAlpha,"tex1");

// MultiplyAlpha
global.gles_MultiplyAlpha_tex0 = shader_get_sampler_index(gles_MultiplyAlpha,"tex0");
global.gles_MultiplyAlpha_tex1 = shader_get_sampler_index(gles_MultiplyAlpha,"tex1");

/** Bend **/

// Bend
global.gles_Bend_tex0 = shader_get_sampler_index(gles_Bend,"tex0");
global.gles_Bend_tex1 = shader_get_sampler_index(gles_Bend,"tex1");

// Bend R
global.gles_BendR_tex0 = shader_get_sampler_index(gles_BendR,"tex0");
global.gles_BendR_tex1 = shader_get_sampler_index(gles_BendR,"tex1");

// Bend G
global.gles_BendG_tex0 = shader_get_sampler_index(gles_BendG,"tex0");
global.gles_BendG_tex1 = shader_get_sampler_index(gles_BendG,"tex1");

// Bend B
global.gles_BendB_tex0 = shader_get_sampler_index(gles_BendB,"tex0");
global.gles_BendB_tex1 = shader_get_sampler_index(gles_BendB,"tex1");


// Bend RG
global.gles_BendRG_tex0 = shader_get_sampler_index(gles_BendRG,"tex0");
global.gles_BendRG_tex1 = shader_get_sampler_index(gles_BendRG,"tex1");

// Bend RB
global.gles_BendRB_tex0 = shader_get_sampler_index(gles_BendRB,"tex0");
global.gles_BendRB_tex1 = shader_get_sampler_index(gles_BendRB,"tex1");

// Bend GB
global.gles_BendGB_tex0 = shader_get_sampler_index(gles_BendGB,"tex0");
global.gles_BendGB_tex1 = shader_get_sampler_index(gles_BendGB,"tex1");

/** Blend **/

// Blend 3 Additive
global.gles_3Add_tex0 = shader_get_sampler_index(gles_3Add,"tex0");
global.gles_3Add_tex1 = shader_get_sampler_index(gles_3Add,"tex1");
global.gles_3Add_tex2 = shader_get_sampler_index(gles_3Add,"tex2");
global.gles_3Add_tex3 = shader_get_sampler_index(gles_3Add,"tex3");

// Blend 3 Average
global.gles_3Avg_tex0 = shader_get_sampler_index(gles_3Avg,"tex0");
global.gles_3Avg_tex1 = shader_get_sampler_index(gles_3Avg,"tex1");
global.gles_3Avg_tex2 = shader_get_sampler_index(gles_3Avg,"tex2");
global.gles_3Avg_tex3 = shader_get_sampler_index(gles_3Avg,"tex3");

/** Blur **/

// Pulse
global.gles_Pulse_time       = shader_get_uniform(gles_Pulse,"time");
global.gles_Pulse_resolution = shader_get_uniform(gles_Pulse,"Resolution");
global.gles_Pulse_position   = shader_get_uniform(gles_Pulse,"Position");
global.gles_Pulse_viewport   = shader_get_uniform(gles_Pulse,"Viewport");
global.gles_Pulse_tex0       = shader_get_sampler_index(gles_Pulse,"tex0");

// Dream Blur
global.gles_DreamBlur_sceneTex = shader_get_sampler_index(gles_DreamBlur,"sceneTex");

// Dream Blur RGB
global.gles_DreamBlurRGB_sceneTex = shader_get_sampler_index(gles_DreamBlurRGB,"sceneTex");
global.gles_DreamBlurRGB_a = shader_get_uniform(gles_DreamBlurRGB,"a");
global.gles_DreamBlurRGB_b = shader_get_uniform(gles_DreamBlurRGB,"b");
global.gles_DreamBlurRGB_c = shader_get_uniform(gles_DreamBlurRGB,"c");
global.gles_DreamBlurRGB_d = shader_get_uniform(gles_DreamBlurRGB,"d");
global.gles_DreamBlurRGB_e = shader_get_uniform(gles_DreamBlurRGB,"e");
global.gles_DreamBlurRGB_f = shader_get_uniform(gles_DreamBlurRGB,"f");
global.gles_DreamBlurRGB_factor = shader_get_uniform(gles_DreamBlurRGB,"factor");
global.gles_DreamBlurRGB_offset = shader_get_uniform(gles_DreamBlurRGB,"offset");

// Radial Blur
global.gles_Radial_time       = shader_get_uniform(gles_Radial,"time");
global.gles_Radial_position   = shader_get_uniform(gles_Radial,"Position");
global.gles_Radial_resolution = shader_get_uniform(gles_Radial,"Resolution");
global.gles_Radial_viewport   = shader_get_uniform(gles_Radial,"Viewport");
global.gles_Radial_mouse      = shader_get_uniform(gles_Radial,"mouse");
global.gles_Radial_tex0       = shader_get_sampler_index(gles_Radial,"tex0");

// Ripple Blur
global.gles_Ripple_tex0 = shader_get_sampler_index(gles_Ripple,"tex0");
global.gles_Ripple_time       = shader_get_uniform(gles_Ripple,"time");
global.gles_Ripple_scale      = shader_get_uniform(gles_Ripple,"Scale");
global.gles_Ripple_resolution = shader_get_uniform(gles_Ripple,"resolution");

// Sigma V9 Gaussian
//...//

/** Color Threshold **/

// Above
global.gles_Above_threshold = shader_get_uniform(gles_Above,"threshold");
global.gles_Above_replace = shader_get_uniform(gles_Above,"replace");
global.gles_Above_tex0 = shader_get_sampler_index(gles_Above,"tex0");

// Above B
global.gles_AboveB_threshold = shader_get_uniform(gles_AboveB,"threshold");
global.gles_AboveB_tex0 = shader_get_sampler_index(gles_AboveB,"tex0");

// Above Below
global.gles_AboveBelow_tex0 = shader_get_sampler_index(gles_AboveBelow,"tex0");
global.gles_AboveBelow_threshold = shader_get_uniform(gles_AboveBelow,"threshold");
global.gles_AboveBelow_above = shader_get_uniform(gles_AboveBelow,"above");
global.gles_AboveBelow_below = shader_get_uniform(gles_AboveBelow,"below");

// Below
global.gles_Below_threshold = shader_get_uniform(gles_Below,"threshold");
global.gles_Below_replace = shader_get_uniform(gles_Below,"replace");
global.gles_Below_tex0 = shader_get_sampler_index(gles_Below,"tex0");

// BelowB
global.gles_BelowB_threshold = shader_get_uniform(gles_BelowB,"threshold");
global.gles_BelowB_tex0 = shader_get_sampler_index(gles_BelowB,"tex0");

// BelowAB
global.gles_BelowAB_tex0 = shader_get_sampler_index(gles_BelowAB,"tex0");
global.gles_BelowAB_A = shader_get_uniform(gles_BelowAB,"thresholdA");
global.gles_BelowAB_B = shader_get_uniform(gles_BelowAB,"thresholdB");

/** Convolution **/

// Emboss
global.gles_Emboss_tex0 = shader_get_sampler_index(gles_Emboss,"tex0");

// Emboss / Tint
global.gles_EmbossTint_tex0 = shader_get_sampler_index(gles_EmbossTint,"tex0");

/** Displacement Mapping **/

// HeightToNormal
global.gles_HeightToNormal_tex0 = shader_get_sampler_index(gles_HeightToNormal, "tex0");
global.gles_HeightToNormal_coef = shader_get_uniform(gles_HeightToNormal, "coef");
global.gles_HeightToNormal_resolution = shader_get_uniform(gles_HeightToNormal, "resolution");

// 2D Normal Map (1 Light)
global.gles_2dNormalMap_1L_tex0 = shader_get_sampler_index(gles_2dNormalMap_1L,"s_multitex");
global.gles_2dNormalMap_1L_resolution = shader_get_uniform(gles_2dNormalMap_1L,"Resolution");
global.gles_2dNormalMap_1L_light_pos = shader_get_uniform(gles_2dNormalMap_1L,"LightPos");
global.gles_2dNormalMap_1L_light_color = shader_get_uniform(gles_2dNormalMap_1L,"LightColor");
global.gles_2dNormalMap_1L_light_falloff = shader_get_uniform(gles_2dNormalMap_1L,"AmbientColor");
global.gles_2dNormalMap_1L_ambient = shader_get_uniform(gles_2dNormalMap_1L,"Falloff");

global.gles_2dNormalMap_resolution[0]=1.0;
global.gles_2dNormalMap_resolution[1]=1.0;

global.gles_2dNormalMap_ambient[0]=0.6;
global.gles_2dNormalMap_ambient[1]=0.6;
global.gles_2dNormalMap_ambient[2]=1.0;
global.gles_2dNormalMap_ambient[3]=0.5;

global.gles_2dNormalMap_Light1_position[0]=0.0;
global.gles_2dNormalMap_Light1_position[1]=0.0;
global.gles_2dNormalMap_Light1_position[2]=0.0;
global.gles_2dNormalMap_Light1_color[0]=0.94;
global.gles_2dNormalMap_Light1_color[1]=0.77;
global.gles_2dNormalMap_Light1_color[2]=0.17;
global.gles_2dNormalMap_Light1_color[3]=2.0;
global.gles_2dNormalMap_Light1_falloff[0]=0.4;
global.gles_2dNormalMap_Light1_falloff[1]=2.0;
global.gles_2dNormalMap_Light1_falloff[2]=10.0;

global.gles_2dNormalMap_Light2_position[0]=0.0;
global.gles_2dNormalMap_Light2_position[1]=0.0;
global.gles_2dNormalMap_Light2_position[2]=0.0;
global.gles_2dNormalMap_Light2_color[0]=0.94;
global.gles_2dNormalMap_Light2_color[1]=0.77;
global.gles_2dNormalMap_Light2_color[2]=0.17;
global.gles_2dNormalMap_Light2_color[3]=2.0;
global.gles_2dNormalMap_Light2_falloff[0]=0.4;
global.gles_2dNormalMap_Light2_falloff[1]=2.0;
global.gles_2dNormalMap_Light2_falloff[2]=10.0;

global.gles_2dNormalMap_Light3_position[0]=0.0;
global.gles_2dNormalMap_Light3_position[1]=0.0;
global.gles_2dNormalMap_Light3_position[2]=0.0;
global.gles_2dNormalMap_Light3_color[0]=0.94;
global.gles_2dNormalMap_Light3_color[1]=0.77;
global.gles_2dNormalMap_Light3_color[2]=0.17;
global.gles_2dNormalMap_Light3_color[3]=2.0;
global.gles_2dNormalMap_Light3_falloff[0]=0.4;
global.gles_2dNormalMap_Light3_falloff[1]=2.0;
global.gles_2dNormalMap_Light3_falloff[2]=10.0;

/** Distortion **/

// Barrel
global.gles_Barrel_tex0 = shader_get_sampler_index(gles_Barrel, "rubyTexture");
global.gles_Barrel_resolution = shader_get_uniform(gles_Barrel, "rubyInputSize");
global.gles_Barrel_texture_resolution = shader_get_uniform(gles_Barrel, "rubyTextureSize");
global.gles_Barrel_distortion = shader_get_uniform(gles_Barrel, "distortion" );

// Bloom
global.gles_Bloom_tex0 = shader_get_sampler_index(gles_Bloom, "tex0");
global.gles_Bloom_a = shader_get_uniform(gles_Bloom,"a");
global.gles_Bloom_b = shader_get_uniform(gles_Bloom,"b");
global.gles_Bloom_c = shader_get_uniform(gles_Bloom,"c");
global.gles_Bloom_d = shader_get_uniform(gles_Bloom,"d");
global.gles_Bloom_e = shader_get_uniform(gles_Bloom,"e");
global.gles_Bloom_f = shader_get_uniform(gles_Bloom,"f");
global.gles_Bloom_g = shader_get_uniform(gles_Bloom,"g");

// Deformer
global.gles_Deformer_tex0 = shader_get_sampler_index(gles_Deformer, "tex0");
global.gles_Deformer_tex1 = shader_get_sampler_index(gles_Deformer, "tex1");
global.gles_Deformer_rgbFactor = shader_get_uniform(gles_Deformer,"rgbFactor");
global.gles_Deformer_mouse = shader_get_uniform(gles_Deformer,"mouse");
global.gles_Deformer_time = shader_get_uniform(gles_Deformer,"time");
global.gles_Deformer_offset = shader_get_uniform(gles_Deformer,"textureOffset");
global.gles_Deformer_position = shader_get_uniform(gles_Deformer,"Position");
global.gles_Deformer_resolution = shader_get_uniform(gles_Deformer,"Resolution");
global.gles_Deformer_viewport = shader_get_uniform(gles_Deformer,"Viewport");

// Frosted
global.gles_Frosted_scene      = shader_get_sampler_index(gles_Frosted, "sceneTex");
global.gles_Frosted_noise      = shader_get_sampler_index(gles_Frosted, "NoiseTex");
global.gles_Frosted_freq       = shader_get_uniform(gles_Frosted,"Freq");
global.gles_Frosted_resolution = shader_get_uniform(gles_Frosted,"resolution");
global.gles_Frosted_pixel      = shader_get_uniform(gles_Frosted,"pixel");

// Frosted2
global.gles_Frosted2_scene  = shader_get_sampler_index(gles_Frosted2,"sceneTex");
global.gles_Frosted2_factor = shader_get_uniform(gles_Frosted2,"rnd_factor");
global.gles_Frosted2_scale  = shader_get_uniform(gles_Frosted2,"rnd_scale");
global.gles_Frosted2_v1     = shader_get_uniform(gles_Frosted2,"v1");
global.gles_Frosted2_v2     = shader_get_uniform(gles_Frosted2,"v2");

// Implode
global.gles_Implode_tex = shader_get_sampler_index(gles_Implode,"tex");

// Motion (Fractal)
global.gles_Motion_tex0       = shader_get_sampler_index(gles_Motion,"tex0");
global.gles_Motion_tex1       = shader_get_sampler_index(gles_Motion,"tex1");
global.gles_Motion_position   = shader_get_uniform(gles_Motion,"Position");
global.gles_Motion_resolution = shader_get_uniform(gles_Motion,"Resolution");
global.gles_Motion_viewport   = shader_get_uniform(gles_Motion,"Viewport");
global.gles_Motion_time       = shader_get_uniform(gles_Motion,"time");

// Phosphor (TV)
global.gles_Phosphor_tex0     = shader_get_sampler_index(gles_Phosphor,"rubyTexture");
global.gles_Phosphor_texture_resolution = shader_get_uniform(gles_Phosphor,"rubyTextureSize");

// Shockwave
global.gles_Shockwave_tex0    = shader_get_sampler_index(gles_Shockwave,"tex0");
global.gles_Shockwave_center  = shader_get_uniform(gles_Shockwave,"center");
global.gles_Shockwave_time    = shader_get_uniform(gles_Shockwave,"time");
global.gles_Shockwave_wave    = shader_get_uniform(gles_Shockwave,"shockParams");

// Sniper Lens
global.gles_SniperLens_tex0   = shader_get_sampler_index(gles_SniperLens,"sceneTex");
global.gles_SniperLens_lens   = shader_get_uniform(gles_SniperLens,"lensRadius");

// Cubic Distortion
global.gles_Cubic_tex0 = shader_get_sampler_index(gles_Cubic,"tex0");
global.gles_Cubic_viewport = shader_get_uniform(gles_Cubic,"Viewport");
global.gles_Cubic_k = shader_get_uniform(gles_Cubic,"k");
global.gles_Cubic_kcube = shader_get_uniform(gles_Cubic,"kcube");
global.gles_Cubic_canvas = shader_get_uniform(gles_Cubic,"canvas");
global.gles_Cubic_center = shader_get_uniform(gles_Cubic,"center");
global.gles_Cubic_disperseComponents = shader_get_uniform(gles_Cubic,"disperseComponents");
global.gles_Cubic_dispersion = shader_get_uniform(gles_Cubic,"dispersion");
global.gles_Cubic_scale = shader_get_uniform(gles_Cubic,"Scale");

// Swirl
global.gles_Swirl_tex0 = shader_get_sampler_index(gles_Swirl,"tex0");
global.gles_Swirl_resolution = shader_get_uniform(gles_Swirl,"resolution");
global.gles_Swirl_center = shader_get_uniform(gles_Swirl,"center");
global.gles_Swirl_radius = shader_get_uniform(gles_Swirl,"radius");
global.gles_Swirl_angle  = shader_get_uniform(gles_Swirl,"angle");
global.gles_Swirl_time   = shader_get_uniform(gles_Swirl,"time");

// Vortex
global.gles_Vortex_tex0 = shader_get_sampler_index(gles_Vortex,"tex0");
global.gles_Vortex_resolution = shader_get_uniform(gles_Vortex,"resolution");
global.gles_Vortex_position   = shader_get_uniform(gles_Vortex,"Position");
global.gles_Vortex_time       = shader_get_uniform(gles_Vortex,"time");

// Wave
global.gles_Wave_time   = shader_get_uniform(gles_Wave,"time");
global.gles_Wave_factor = shader_get_uniform(gles_Wave,"Factor");
global.gles_Wave_scale  = shader_get_uniform(gles_Wave,"Scale");

// Waving (Grass Shader Example)
global.gles_Waving_time  = shader_get_uniform(gles_Waving,"time");
global.gles_Waving_speed = shader_get_uniform(gles_Waving,"spd");
global.gles_Waving_bend  = shader_get_uniform(gles_Waving,"bendfactor");

/** Fractal **/

// FBM
global.gles_FBM_time = shader_get_uniform(gles_FBM,"time");
global.gles_FBM_colorAmp = shader_get_uniform(gles_FBM,"colorAmp");
global.gles_FBM_resolution = shader_get_uniform(gles_FBM,"resolution");
global.gles_FBM_position = shader_get_uniform(gles_FBM,"position");
global.gles_FBM_fader = shader_get_uniform(gles_FBM,"fader");
global.gles_FBM_factor = shader_get_uniform(gles_FBM,"factor");
global.gles_FBM_p1 = shader_get_uniform(gles_FBM,"p1");
global.gles_FBM_p2 = shader_get_uniform(gles_FBM,"p2");
global.gles_FBM_p3 = shader_get_uniform(gles_FBM,"p3");
global.gles_FBM_p4 = shader_get_uniform(gles_FBM,"p4");

// Change values as needed (used in shader_FBM script).
global.gles_FBM_pattern1[0]=1.7;
global.gles_FBM_pattern1[1]=9.2;
global.gles_FBM_pattern1[2]=8.3;
global.gles_FBM_pattern1[3]=2.8;
global.gles_FBM_pattern2[0]=0.0;
global.gles_FBM_pattern2[1]=0.0;
global.gles_FBM_pattern2[2]=5.2;
global.gles_FBM_pattern2[3]=1.3;
global.gles_FBM_pattern3[0]=2.5;
global.gles_FBM_pattern3[1]=0.4;
global.gles_FBM_pattern3[2]=2.3;
global.gles_FBM_pattern3[3]=0.4;
global.gles_FBM_pattern4[0]=2.3;
global.gles_FBM_pattern4[1]=34.0;
global.gles_FBM_pattern4[2]=4.0;
global.gles_FBM_pattern4[3]=289.0; // mod value

// Clod Fractal
global.gles_Clod_time       = shader_get_uniform(gles_Clod,"time");
global.gles_Clod_position   = shader_get_uniform(gles_Clod,"Position");
global.gles_Clod_resolution = shader_get_uniform(gles_Clod,"Resolution");
global.gles_Clod_undulation = shader_get_uniform(gles_Clod,"undulation");

// Flying Distortion
global.gles_Flying_tex0       = shader_get_sampler_index(gles_Flying,"tex0");
global.gles_Flying_time       = shader_get_uniform(gles_Flying,"time");
global.gles_Flying_resolution = shader_get_uniform(gles_Flying,"Resolution");
global.gles_Flying_position   = shader_get_uniform(gles_Flying,"Position");
global.gles_Flying_viewport   = shader_get_uniform(gles_Flying,"Viewport");

// Glass Cave (optional "with Ribbon")
global.gles_GlassCave_time       = shader_get_uniform(gles_GlassCave,"time");
global.gles_GlassCave_resolution = shader_get_uniform(gles_GlassCave,"Resolution");
global.gles_GlassCave_position   = shader_get_uniform(gles_GlassCave,"Position");
global.gles_GlassCave_viewport   = shader_get_uniform(gles_GlassCave,"Viewport");

// Gaussian (GPU Gems 3)
global.gles_Gaussian_sigma = shader_get_uniform(gles_Gaussian,"sigma");
global.gles_Gaussian_size = shader_get_uniform(gles_Gaussian,"blurSize");


// Monjori Fractal
global.gles_Monjori_time       = shader_get_uniform(gles_Monjori,"time");
global.gles_Monjori_resolution = shader_get_uniform(gles_Monjori,"Resolution");
global.gles_Monjori_position   = shader_get_uniform(gles_Monjori,"Position");
global.gles_Monjori_viewport   = shader_get_uniform(gles_Monjori,"Viewport");
global.gles_Monjori_rgb1       = shader_get_uniform(gles_Monjori,"rgbFactor1");
global.gles_Monjori_rgb2       = shader_get_uniform(gles_Monjori,"rgbFactor2");
global.gles_Monjori_rgb3       = shader_get_uniform(gles_Monjori,"rgbFactor3");

// Nautilus
global.gles_Nautilus_time       = shader_get_uniform(gles_Nautilus,"time");
global.gles_Nautilus_resolution = shader_get_uniform(gles_Nautilus,"Resolution");
global.gles_Nautilus_position   = shader_get_uniform(gles_Nautilus,"Position");
global.gles_Nautilus_viewport   = shader_get_uniform(gles_Nautilus,"Viewport");
global.gles_Nautilus_mouse      = shader_get_uniform(gles_Nautilus,"mouse");

// Plasma
global.gles_Plasma_time       = shader_get_uniform(gles_Plasma,"time");
global.gles_Plasma_resolution = shader_get_uniform(gles_Plasma,"Resolution");
global.gles_Plasma_position   = shader_get_uniform(gles_Plasma,"Position");
global.gles_Plasma_viewport   = shader_get_uniform(gles_Plasma,"Viewport");
global.gles_Plasma_scale      = shader_get_uniform(gles_Plasma,"Scale");
global.gles_Plasma_factor     = shader_get_uniform(gles_Plasma,"factor");
global.gles_Plasma_factor2    = shader_get_uniform(gles_Plasma,"factor2");

// Tunnel
global.gles_Tunnel_time       = shader_get_uniform(gles_Tunnel,"time");
global.gles_Tunnel_resolution = shader_get_uniform(gles_Tunnel,"Resolution");
global.gles_Tunnel_position   = shader_get_uniform(gles_Tunnel,"Position");
global.gles_Tunnel_viewport   = shader_get_uniform(gles_Tunnel,"Viewport");
global.gles_Tunnel_tex0       = shader_get_sampler_index(gles_Tunnel,"tex0");

// Tunnel2
global.gles_Tunnel2_time       = shader_get_uniform(gles_Tunnel2,"time");
global.gles_Tunnel2_resolution = shader_get_uniform(gles_Tunnel2,"Resolution");
global.gles_Tunnel2_position   = shader_get_uniform(gles_Tunnel2,"Position");
global.gles_Tunnel2_viewport   = shader_get_uniform(gles_Tunnel2,"Viewport");
global.gles_Tunnel2_tex0       = shader_get_sampler_index(gles_Tunnel2,"tex0");

/** Texture Combiners **/

// 2-Way
global.gles_2Way_tex0 = shader_get_sampler_index(gles_2Way,"tex0");
global.gles_2Way_tex1 = shader_get_sampler_index(gles_2Way,"tex1");
global.gles_2Way_tex2 = shader_get_sampler_index(gles_2Way,"tex2");

// 3-Way
global.gles_3Way_tex0 = shader_get_sampler_index(gles_3Way,"tex0");
global.gles_3Way_tex1 = shader_get_sampler_index(gles_3Way,"tex1");
global.gles_3Way_tex2 = shader_get_sampler_index(gles_3Way,"tex2");
global.gles_3Way_tex3 = shader_get_sampler_index(gles_3Way,"tex3");

// 4-Way
global.gles_4Way_tex0 = shader_get_sampler_index(gles_4Way,"tex0");
global.gles_4Way_tex1 = shader_get_sampler_index(gles_4Way,"tex1");
global.gles_4Way_tex2 = shader_get_sampler_index(gles_4Way,"tex2");
global.gles_4Way_tex3 = shader_get_sampler_index(gles_4Way,"tex3");
global.gles_4Way_tex4 = shader_get_sampler_index(gles_4Way,"tex4");

// 5-Way
global.gles_5Way_tex0 = shader_get_sampler_index(gles_5Way,"tex0");
global.gles_5Way_tex1 = shader_get_sampler_index(gles_5Way,"tex1");
global.gles_5Way_tex2 = shader_get_sampler_index(gles_5Way,"tex2");
global.gles_5Way_tex3 = shader_get_sampler_index(gles_5Way,"tex3");
global.gles_5Way_tex4 = shader_get_sampler_index(gles_5Way,"tex4");
global.gles_5Way_tex5 = shader_get_sampler_index(gles_5Way,"tex5");

// 6-Way
global.gles_6Way_tex0 = shader_get_sampler_index(gles_6Way,"tex0");
global.gles_6Way_tex1 = shader_get_sampler_index(gles_6Way,"tex1");
global.gles_6Way_tex2 = shader_get_sampler_index(gles_6Way,"tex2");
global.gles_6Way_tex3 = shader_get_sampler_index(gles_6Way,"tex3");
global.gles_6Way_tex4 = shader_get_sampler_index(gles_6Way,"tex4");
global.gles_6Way_tex5 = shader_get_sampler_index(gles_6Way,"tex5");
global.gles_6Way_tex6 = shader_get_sampler_index(gles_6Way,"tex6");

// 7-Way
global.gles_7Way_tex0 = shader_get_sampler_index(gles_7Way,"tex0");
global.gles_7Way_tex1 = shader_get_sampler_index(gles_7Way,"tex1");
global.gles_7Way_tex2 = shader_get_sampler_index(gles_7Way,"tex2");
global.gles_7Way_tex3 = shader_get_sampler_index(gles_7Way,"tex3");
global.gles_7Way_tex4 = shader_get_sampler_index(gles_7Way,"tex4");
global.gles_7Way_tex5 = shader_get_sampler_index(gles_7Way,"tex5");
global.gles_7Way_tex6 = shader_get_sampler_index(gles_7Way,"tex6");
global.gles_7Way_tex7 = shader_get_sampler_index(gles_7Way,"tex7");

// 8-Way
global.gles_8Way_tex0 = shader_get_sampler_index(gles_8Way,"tex0");
global.gles_8Way_tex1 = shader_get_sampler_index(gles_8Way,"tex1");
global.gles_8Way_tex2 = shader_get_sampler_index(gles_8Way,"tex2");
global.gles_8Way_tex3 = shader_get_sampler_index(gles_8Way,"tex3");
global.gles_8Way_tex4 = shader_get_sampler_index(gles_8Way,"tex4");
global.gles_8Way_tex5 = shader_get_sampler_index(gles_8Way,"tex5");
global.gles_8Way_tex6 = shader_get_sampler_index(gles_8Way,"tex6");
global.gles_8Way_tex7 = shader_get_sampler_index(gles_8Way,"tex7");
global.gles_8Way_tex8 = shader_get_sampler_index(gles_8Way,"tex8");

/** Texture Layering **/

// Layer Combiner
global.gles_LayerCombiner_tweens = shader_get_uniform(gles_LayerCombiner,"tweens");
global.gles_LayerCombiner_tex0 = shader_get_sampler_index(gles_LayerCombiner,"tex0");
global.gles_LayerCombiner_tex1 = shader_get_sampler_index(gles_LayerCombiner,"tex1");
global.gles_LayerCombiner_tex2 = shader_get_sampler_index(gles_LayerCombiner,"tex2");
global.gles_LayerCombiner_time = shader_get_uniform(gles_LayerCombiner,"time");
global.gles_LayerCombiner_T = shader_get_uniform(gles_LayerCombiner,"T");
global.gles_LayerCombiner_TS = shader_get_uniform(gles_LayerCombiner,"TS");
global.gles_LayerCombiner_A = shader_get_uniform(gles_LayerCombiner,"A");
global.gles_LayerCombiner_B = shader_get_uniform(gles_LayerCombiner,"B");
global.gles_LayerCombiner_C = shader_get_uniform(gles_LayerCombiner,"C");
global.gles_LayerCombiner_c1 = shader_get_uniform(gles_LayerCombiner,"c1");
global.gles_LayerCombiner_c2 = shader_get_uniform(gles_LayerCombiner,"c2");
global.gles_LayerCombiner_c3 = shader_get_uniform(gles_LayerCombiner,"c3");

// LayerCombiner uniform values (used in shader_LayerCombiner instead of
// function parameters)
global.gles_LayerCombiner_utextures[0]=sprite_get_texture(s_tweens,0);
global.gles_LayerCombiner_utextures[1]=sprite_get_texture(s_lights_add,0);
global.gles_LayerCombiner_utextures[2]=sprite_get_texture(s_lights_add,1);
global.gles_LayerCombiner_utextures[3]=sprite_get_texture(s_lights_add,2);
global.gles_LayerCombiner_uT[0] =0.5;
global.gles_LayerCombiner_uT[1] =0.6;
global.gles_LayerCombiner_uT[2] =0.7; // current time offset of animation "C"
global.gles_LayerCombiner_uTS[0] =1.0;
global.gles_LayerCombiner_uTS[1] =2.0;
global.gles_LayerCombiner_uTS[2] =3.0; // Timescale of animation "C"
global.gles_LayerCombiner_uA[0] =0.0; /// start time (seconds)
global.gles_LayerCombiner_uA[1] =1.0; /// end time (seconds)
global.gles_LayerCombiner_uA[2] =1.0; /// UV width
global.gles_LayerCombiner_uB[0] =0.0;
global.gles_LayerCombiner_uB[1] =1.0;
global.gles_LayerCombiner_uB[2] =1.0;
global.gles_LayerCombiner_uC[0] =0.0;
global.gles_LayerCombiner_uC[1] =1.0;
global.gles_LayerCombiner_uC[2] =1.0;
global.gles_LayerCombiner_uc1[0]=1.0; // Color for animation "A"
global.gles_LayerCombiner_uc1[1]=0.5;
global.gles_LayerCombiner_uc1[2]=0.3;
global.gles_LayerCombiner_uc2[0]=0.8; // Color 2 for animation "A"
global.gles_LayerCombiner_uc2[1]=0.4;
global.gles_LayerCombiner_uc2[2]=0.5;
global.gles_LayerCombiner_uc3[0]=0.9; // Color 3 for animation "A"
global.gles_LayerCombiner_uc3[1]=0.0;
global.gles_LayerCombiner_uc3[2]=0.7;

/** Stylize **/

// Crosshatch
global.gles_Crosshatch_tex0 = shader_get_sampler_index(gles_Crosshatch,"sceneTex");
global.gles_Crosshatch_yOffset = shader_get_uniform(gles_Crosshatch,"hatch_y_offset");
global.gles_Crosshatch_lumT = shader_get_uniform(gles_Crosshatch,"lumT");
global.gles_Crosshatch_resolution = shader_get_uniform(gles_Crosshatch,"Resolution");

// Gamma Correction
global.gles_Gamma_tex0 = shader_get_sampler_index(gles_Gamma,"sceneBuffer");
global.gles_Gamma_gamma = shader_get_uniform(gles_Gamma,"gamma");

// Nightvision
global.gles_Nightvision_tex0 = shader_get_sampler_index(gles_Nightvision,"sceneBuffer");
global.gles_Nightvision_noise = shader_get_sampler_index(gles_Nightvision,"noiseTex");
global.gles_Nightvision_mask = shader_get_sampler_index(gles_Nightvision,"maskTex");
global.gles_Nightvision_time = shader_get_uniform(gles_Nightvision,"elapsedTime");
global.gles_Nightvision_lum = shader_get_uniform(gles_Nightvision,"luminanceThreshold");
global.gles_Nightvision_amp = shader_get_uniform(gles_Nightvision,"colorAmplification");
global.gles_Nightvision_color = shader_get_uniform(gles_Nightvision,"visionColor");

// Pixelate
global.gles_Pixelate_tex0 = shader_get_sampler_index(gles_Pixelate,"sceneTex");
global.gles_Pixelate_resolution = shader_get_uniform(gles_Pixelate,"Resolution");
global.gles_Pixelate_pixel = shader_get_uniform(gles_Pixelate,"Pixel");

// Simple Frost
global.gles_SimpleFrost_tex0 = shader_get_sampler_index(gles_SimpleFrost,"tex");
global.gles_SimpleFrost_a = shader_get_uniform(gles_SimpleFrost,"a");
global.gles_SimpleFrost_b = shader_get_uniform(gles_SimpleFrost,"b");
global.gles_SimpleFrost_offset = shader_get_uniform(gles_SimpleFrost,"offset");
global.gles_SimpleFrost_d = shader_get_uniform(gles_SimpleFrost,"d");
global.gles_SimpleFrost_scale = shader_get_uniform(gles_SimpleFrost,"Scale");

// Thermal Imaging
global.gles_Thermal_tex0 = shader_get_sampler_index(gles_Thermal,"sceneTex");
global.gles_Thermal_c1 = shader_get_uniform(gles_Thermal,"c1");
global.gles_Thermal_c2 = shader_get_uniform(gles_Thermal,"c2");
global.gles_Thermal_c3 = shader_get_uniform(gles_Thermal,"c3");

// TV
global.gles_TV_tex0       = shader_get_sampler_index(gles_TV,"tex0");
global.gles_TV_time       = shader_get_uniform(gles_TV,"time");
global.gles_TV_position   = shader_get_uniform(gles_TV,"Position");
global.gles_TV_resolution = shader_get_uniform(gles_TV,"Resolution");
global.gles_TV_viewport   = shader_get_uniform(gles_TV,"Viewport");
global.gles_TV_size       = shader_get_uniform(gles_TV,"size");

// TV2
global.gles_TV2_time       = shader_get_uniform(gles_TV2,"time");

// Grainy
global.gles_Grainy_time    = shader_get_uniform(gles_Grainy,"g_Time");
global.gles_Grainy_color   = shader_get_uniform(gles_Grainy,"m_FilterColor");
global.gles_Grainy_density = shader_get_uniform(gles_Grainy,"m_ColorDensity");
global.gles_Grainy_random  = shader_get_uniform(gles_Grainy,"m_RandomValue");
global.gles_Grainy_noise   = shader_get_uniform(gles_Grainy,"m_NoiseDensity");
global.gles_Grainy_scratch = shader_get_uniform(gles_Grainy,"m_ScratchDensity");

// Grainy2
global.gles_Grainy2_time    = shader_get_uniform(gles_Grainy2,"g_Time");
global.gles_Grainy2_color   = shader_get_uniform(gles_Grainy2,"m_FilterColor");
global.gles_Grainy2_density = shader_get_uniform(gles_Grainy2,"m_ColorDensity");
global.gles_Grainy2_random  = shader_get_uniform(gles_Grainy2,"m_RandomValue");
global.gles_Grainy2_noise   = shader_get_uniform(gles_Grainy2,"m_NoiseDensity");
global.gles_Grainy2_scratch = shader_get_uniform(gles_Grainy2,"m_ScratchDensity");

// Luminance
 //(none)

// Tone
 //(none)
 
/** Stencil **/

// Stencil
global.gles_Stencil_tex0 = shader_get_sampler_index(gles_Stencil,"tex0");
global.gles_Stencil_tex1 = shader_get_sampler_index(gles_Stencil,"tex1");

// Stencil2
global.gles_Stencil2_tex0 = shader_get_sampler_index(gles_Stencil2,"tex0");
global.gles_Stencil2_tex1 = shader_get_sampler_index(gles_Stencil2,"tex1");
global.gles_Stencil2_tex2 = shader_get_sampler_index(gles_Stencil2,"tex2");

// Stencil3
global.gles_Stencil3_tex0 = shader_get_sampler_index(gles_Stencil3,"tex0");
global.gles_Stencil3_tex1 = shader_get_sampler_index(gles_Stencil3,"tex1");
global.gles_Stencil3_tex2 = shader_get_sampler_index(gles_Stencil3,"tex2");
global.gles_Stencil3_tex3 = shader_get_sampler_index(gles_Stencil3,"tex3");

// Stencil4
global.gles_Stencil4_tex0 = shader_get_sampler_index(gles_Stencil4,"tex0");
global.gles_Stencil4_tex1 = shader_get_sampler_index(gles_Stencil4,"tex1");
global.gles_Stencil4_tex2 = shader_get_sampler_index(gles_Stencil4,"tex2");
global.gles_Stencil4_tex3 = shader_get_sampler_index(gles_Stencil4,"tex3");
global.gles_Stencil4_tex4 = shader_get_sampler_index(gles_Stencil4,"tex4");

// StencilAdd
global.gles_StencilAdd_tex0 = shader_get_sampler_index(gles_StencilAdd,"tex0");
global.gles_StencilAdd_tex1 = shader_get_sampler_index(gles_StencilAdd,"tex1");

// StencilAdd2
global.gles_StencilAdd2_tex0 = shader_get_sampler_index(gles_StencilAdd2,"tex0");
global.gles_StencilAdd2_tex1 = shader_get_sampler_index(gles_StencilAdd2,"tex1");
global.gles_StencilAdd2_tex2 = shader_get_sampler_index(gles_StencilAdd2,"tex2");

// StencilAdd3
global.gles_StencilAdd3_tex0 = shader_get_sampler_index(gles_StencilAdd3,"tex0");
global.gles_StencilAdd3_tex1 = shader_get_sampler_index(gles_StencilAdd3,"tex1");
global.gles_StencilAdd3_tex2 = shader_get_sampler_index(gles_StencilAdd3,"tex2");
global.gles_StencilAdd3_tex3 = shader_get_sampler_index(gles_StencilAdd3,"tex3");

// StencilAdd4
global.gles_StencilAdd4_tex0 = shader_get_sampler_index(gles_StencilAdd4,"tex0");
global.gles_StencilAdd4_tex1 = shader_get_sampler_index(gles_StencilAdd4,"tex1");
global.gles_StencilAdd4_tex2 = shader_get_sampler_index(gles_StencilAdd4,"tex2");
global.gles_StencilAdd4_tex3 = shader_get_sampler_index(gles_StencilAdd4,"tex3");
global.gles_StencilAdd4_tex4 = shader_get_sampler_index(gles_StencilAdd4,"tex4");

// StencilAvg2
global.gles_StencilAvg2_tex0 = shader_get_sampler_index(gles_StencilAvg2,"tex0");
global.gles_StencilAvg2_tex1 = shader_get_sampler_index(gles_StencilAvg2,"tex1");
global.gles_StencilAvg2_tex2 = shader_get_sampler_index(gles_StencilAvg2,"tex2");

// StencilAvg3
global.gles_StencilAvg3_tex0 = shader_get_sampler_index(gles_StencilAvg3,"tex0");
global.gles_StencilAvg3_tex1 = shader_get_sampler_index(gles_StencilAvg3,"tex1");
global.gles_StencilAvg3_tex2 = shader_get_sampler_index(gles_StencilAvg3,"tex2");
global.gles_StencilAvg3_tex3 = shader_get_sampler_index(gles_StencilAvg3,"tex3");

// StencilAvg4
global.gles_StencilAvg4_tex0 = shader_get_sampler_index(gles_StencilAvg4,"tex0");
global.gles_StencilAvg4_tex1 = shader_get_sampler_index(gles_StencilAvg4,"tex1");
global.gles_StencilAvg4_tex2 = shader_get_sampler_index(gles_StencilAvg4,"tex2");
global.gles_StencilAvg4_tex3 = shader_get_sampler_index(gles_StencilAvg4,"tex3");
global.gles_StencilAvg4_tex4 = shader_get_sampler_index(gles_StencilAvg4,"tex4");

// StencilMult2
global.gles_StencilMult2_tex0 = shader_get_sampler_index(gles_StencilMult2,"tex0");
global.gles_StencilMult2_tex1 = shader_get_sampler_index(gles_StencilMult2,"tex1");
global.gles_StencilMult2_tex2 = shader_get_sampler_index(gles_StencilMult2,"tex2");

// StencilMult3
global.gles_StencilMult3_tex0 = shader_get_sampler_index(gles_StencilMult3,"tex0");
global.gles_StencilMult3_tex1 = shader_get_sampler_index(gles_StencilMult3,"tex1");
global.gles_StencilMult3_tex2 = shader_get_sampler_index(gles_StencilMult3,"tex2");
global.gles_StencilMult3_tex3 = shader_get_sampler_index(gles_StencilMult3,"tex3");

// StencilMult4
global.gles_StencilMult4_tex0 = shader_get_sampler_index(gles_StencilMult4,"tex0");
global.gles_StencilMult4_tex1 = shader_get_sampler_index(gles_StencilMult4,"tex1");
global.gles_StencilMult4_tex2 = shader_get_sampler_index(gles_StencilMult4,"tex2");
global.gles_StencilMult4_tex3 = shader_get_sampler_index(gles_StencilMult4,"tex3");
global.gles_StencilMult4_tex4 = shader_get_sampler_index(gles_StencilMult4,"tex4");

// StencilMult2Alpha
global.gles_StencilMult2Alpha_tex0 = shader_get_sampler_index(gles_StencilMult2Alpha,"tex0");
global.gles_StencilMult2Alpha_tex1 = shader_get_sampler_index(gles_StencilMult2Alpha,"tex1");
global.gles_StencilMult2Alpha_tex2 = shader_get_sampler_index(gles_StencilMult2Alpha,"tex2");


// Scaling

//HQ2X
global.gles_HQ2X_tex0 = shader_get_sampler_index(gles_HQ2X,"rubyTexture");
global.gles_HQ2X_texture_res = shader_get_sampler_index(gles_HQ2X,"rubyTextureSize");

//HQ4X
global.gles_HQ4X_tex0 = shader_get_sampler_index(gles_HQ4X,"rubyTexture");
global.gles_HQ4X_texture_res = shader_get_sampler_index(gles_HQ4X,"rubyTextureSize");

//HQ4X v2
global.gles_HQ4X2_tex0 = shader_get_sampler_index(gles_HQ4X_2,"tex0");
//global.gles_HQ4X2_Screen_Size = shader_get_sampler_index(gles_HQ4X_2,"ScreenSize");
global.gles_HQ4X2_texture_res = shader_get_sampler_index(gles_HQ4X_2,"textureSize");

//4XBR
global.gles_4XBR_tex0 = shader_get_sampler_index(gles_4XBR,"tex0");
//global.gles_4XBR_Screen_Size = shader_get_sampler_index(gles_4XBR,"ScreenSize");
global.gles_4XBR_texture_res = shader_get_sampler_index(gles_4XBR,"textureSize");

//DotBloom
global.gles_DotBloom_tex0 = shader_get_sampler_index(gles_DotBloom,"rubyTexture");
global.gles_DotBloom_TexSize = shader_get_uniform(gles_DotBloom,"rubyTextureSize");
global.gles_DotBloom_InSize = shader_get_uniform(gles_DotBloom,"rubyInputSize");
global.gles_DotBloom_OutSize = shader_get_uniform(gles_DotBloom,"rubyOutputSize");
global.gles_DotBloom_gamma = shader_get_uniform(gles_DotBloom,"gamma");
global.gles_DotBloom_shine = shader_get_uniform(gles_DotBloom,"shine");
global.gles_DotBloom_blend = shader_get_uniform(gles_DotBloom,"blend");

//Quilez getTexel
global.gles_Quilez_tex0 = shader_get_sampler_index(gles_Quilez,"rubyTexture");
global.gles_Quilez_texture_res = shader_get_sampler_index(gles_Quilez,"rubyTextureSize");


// CRT / TV Simulation

// Phosphorish

//global.gles_Phosphorish_tex0 = shader_get_sampler_index(gles_HQ4X_2,"tex0");
//global.gles_Phosphorish_texture_res = shader_get_sampler_index(gles_HQ4X_2,"textureSize");

// PipBoy
global.gles_PipBoy_tex0 = shader_get_sampler_index(gles_PipBoy,"tex0");
global.gles_PipBoy_time = shader_get_uniform(gles_PipBoy,"time");
global.gles_PipBoy_texture_res = shader_get_uniform(gles_PipBoy,"textureSize");
global.gles_PipBoy_output_res = shader_get_uniform(gles_PipBoy,"outputSize");
global.gles_PipBoy_tone = shader_get_uniform(gles_PipBoy,"tone");

// Waterpaint

global.gles_Waterpaint_tex0 = shader_get_sampler_index(gles_Waterpaint,"tex0");
global.gles_Waterpaint_texture_res = shader_get_uniform(gles_Waterpaint,"textureSize");

