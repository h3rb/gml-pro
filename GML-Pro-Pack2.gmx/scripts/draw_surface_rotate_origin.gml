/*
argument 0 = surface id
argument 1 = local origin x
argument 2 = local origin y
argument 3 = x
argument 4 = y
argument 5 = angle
argument 6 = xscale
argument 7 = yscale
*/
d3d_transform_stack_push();
d3d_transform_set_translation(-argument1, -argument2, 0);
d3d_transform_add_rotation_z(argument5);
d3d_transform_add_translation(argument3, argument4, 0);
d3d_transform_add_scaling(argument6,argument7,1.0);
draw_surface(argument0, 0,0);
d3d_transform_stack_pop();
