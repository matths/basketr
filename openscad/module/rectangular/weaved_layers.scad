// rectangular/weaved_layers.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

use <bulged_shape.scad>

module weaved_layers(num_of_rods, bulge, basket_length, basket_width, corner_radius, thickness, basket_height, num_of_layers = 0, epsilon = 0.1) {
  num_of_layers = num_of_layers == 0 ? round(basket_height / (2 * bulge)) : num_of_layers;
  layer_thickness = basket_height / num_of_layers;
  for (i=[0:num_of_layers - 1])
    translate([0, 0, i * layer_thickness])
    linear_extrude(layer_thickness + epsilon)
    bulged_shape(basket_length, basket_width, corner_radius, num_of_rods, bulge, thickness, i % 2 == 0);
}

module rectangular_weaved_layers(num_of_rods, bulge, basket_length, basket_width, corner_radius, thickness, basket_height, num_of_layers = 0, epsilon = 0.1) {
  weaved_layers(num_of_rods, bulge, basket_length, basket_width, corner_radius, thickness, basket_height, num_of_layers, epsilon);
}
