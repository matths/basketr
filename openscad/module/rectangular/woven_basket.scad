// rectangular/woven_basket.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

use <ring.scad>
use <plate.scad>
use <rods.scad>
use <weaved_layers.scad>

module woven_basket(
  basket_length = 100,
  basket_width = 80,
  basket_height = 80,
  num_of_rods = 24,
  rod_radius = 1,
  corner_radius = 15,
  num_of_layers = 8,
  ring_radius = 0,
  thickness = 1,
  epsilon = 0.1
) {
  ring_radius = ring_radius == 0 ? 1.8 * rod_radius : ring_radius;
  base_length = basket_length + 2 * ring_radius;
  base_width = basket_width + 2 * ring_radius;
  base_radius = corner_radius;

  ring(base_length, base_width, base_radius, ring_radius, basket_height);
  weaved_layers(num_of_rods, rod_radius, basket_length, basket_width, corner_radius, thickness, basket_height, num_of_layers);
  rods(basket_length, basket_width, corner_radius, num_of_rods, rod_radius, basket_height);
  ring(base_length, base_width, base_radius, ring_radius, 0);
  plate(base_length, base_width, base_radius, ring_radius, -ring_radius/2);
}

module rectangular_woven_basket(
  basket_length = 100,
  basket_width = 80,
  basket_height = 80,
  num_of_rods = 24,
  rod_radius = 1,
  corner_radius = 15,
  num_of_layers = 8,
  ring_radius = 0,
  thickness = 1,
  epsilon = 0.1
) {
  woven_basket(basket_length, basket_width, basket_height, num_of_rods,
    rod_radius, corner_radius, num_of_layers, ring_radius, thickness, epsilon);
}
