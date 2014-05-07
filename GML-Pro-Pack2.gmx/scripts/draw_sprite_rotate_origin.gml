/*
argument 0 = sprite id
argument 1 = sub image
argument 2 = local origin x
argument 3 = local origin y
argument 4 = x
argument 5 = y
argument 6 = angle
*/
d3d_transform_stack_push();
d3d_transform_set_translation(-argument2, -argument3, 0);
d3d_transform_add_rotation_z(argument6);
d3d_transform_add_translation(argument4, argument5, 0);
draw_sprite(argument0, argument1, 0,0);
d3d_transform_stack_pop();
