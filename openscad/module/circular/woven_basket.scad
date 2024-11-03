// circular/woven_basket.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

// Parts derived from Parametric Woven Structure
// Copyright 2019 Zoé Böle (zoe1337)
// Licensed under the BSD 2-Clause License
// https://www.thingiverse.com/thing:3600485
// https://www.reddit.com/r/3Dprinting/comments/bjg15c/comment/em8awxe/
// (Zoé Böle, zoe1337, https://chaos.social/@uint8_t, https://github.com/zoe1337)

use <ring.scad>
use <plate.scad>
use <rods.scad>
use <weaved_layers.scad>

module woven_basket(
	basket_radius = 40,
	basket_height = 80,
	rod_radius = 1,
	num_of_rods = 16,
	num_of_layers = 8,
	woven_thickness = 1,
	ring_radius = 1.8
) {
	base_radius = basket_radius + ring_radius;

	ring(base_radius, ring_radius, basket_height);
	weaved_layers(basket_radius, rod_radius, num_of_rods, woven_thickness, basket_height, num_of_layers);
	rods(basket_radius, rod_radius, num_of_rods, basket_height);
	ring(base_radius, ring_radius, 0);
	plate(base_radius, ring_radius, -ring_radius / 2);
}

module circular_woven_basket(
	basket_radius = 40,
	basket_height = 80,
	rod_radius = 1,
	num_of_rods = 16,
	num_of_layers = 8,
	woven_thickness = 1,
	ring_radius = 2
) {
	woven_basket(basket_radius, basket_height, rod_radius, num_of_rods, num_of_layers, woven_thickness, ring_radius);
}
