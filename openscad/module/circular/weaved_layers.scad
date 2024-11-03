// circular/weaved_layers.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

// Parts derived from Parametric Woven Structure
// Copyright 2019 Zoé Böle (zoe1337)
// Licensed under the BSD 2-Clause License
// https://www.thingiverse.com/thing:3600485
// https://www.reddit.com/r/3Dprinting/comments/bjg15c/comment/em8awxe/
// (Zoé Böle, zoe1337, https://chaos.social/@uint8_t, https://github.com/zoe1337)

use <bulged_shape.scad>

module weaved_layers(basket_radius, bulge, num_of_rods, thickness, basket_height, num_of_layers = 0, epsilon = 0.1) {
  num_of_layers = num_of_layers == 0 ? round(basket_height / (2 * bulge)) : num_of_layers;
  layer_thickness = basket_height / num_of_layers;
  for (i = [0:(num_of_layers-1)])
    translate([0, 0, i * layer_thickness])
    linear_extrude(layer_thickness + epsilon)
    bulged_shape(basket_radius, bulge, num_of_rods, thickness, i % 2 == 0);
}

module circular_weaved_layers(basket_radius, bulge, num_of_rods, thickness, basket_height, num_of_layers = 0, epsilon = 0.1) {
  weaved_layers(basket_radius, bulge, num_of_rods, thickness, basket_height, num_of_layers, epsilon);
}
