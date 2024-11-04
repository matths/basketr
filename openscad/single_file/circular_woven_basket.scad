/* [Basket Dimensions] */

// Radius
basket_radius = 40; // [10:1:150]

// Height
basket_height = 80; // [10:1:200]

/* [Other Properties] */

// Number of Rods
num_of_rods = 16; // [4:2:64]

// Rod radius
rod_radius = 1; // [0.4:0.2:8]

// Number of Layers
num_of_layers = 8; // [1:1:24]

// Layer thickness
thickness = 1; // [1:0.2:10]

// Ring radius
ring_radius = 1.8; // [0.4:0.2:5]

module __Customizer_Limit__ () {}  // Hide following assignments from Customizer.

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>
// This code is under MIT Licence.

range = function (length, start = 0)
  length == 0 ? [] : [for (i = [start:start + length - 1]) i]
;

map = function (list, func)
  assert(is_list(list))
  len(list) > 0
    ? [for (index=[0:len(list)-1]) func(list[index], index, list)]
    : []
;

function point_bulged_circle (radius, angle, bulge, number_of_rods) =
  (radius - bulge * cos(angle * number_of_rods / 2)) * [cos(angle), sin(angle)]
;

function points_along_circle (radius, number_of_segments, bulge, number_of_rods) =
  map(
    range(number_of_segments),
    function (num, i, l)
      point_bulged_circle(radius, num / number_of_segments * 360, bulge, number_of_rods)
  )
;

module bulged_shape(radius, bulge, num_of_rods, thickness, opposite = true) {
  bulge = (opposite ? 1 : -1) * bulge;
  point_list_outside = points_along_circle(radius + thickness/2, num_of_rods * 60, bulge, num_of_rods);
  point_list_inside = points_along_circle(radius - thickness/2, num_of_rods * 60, bulge, num_of_rods);

  difference() {
    polygon(point_list_outside);
    polygon(point_list_inside);
  }
}

module weaved_layers(basket_radius, bulge, num_of_rods, thickness, basket_height, num_of_layers = 0, epsilon = 0.1) {
  num_of_layers = num_of_layers == 0 ? round(basket_height / (2 * bulge)) : num_of_layers;
  layer_thickness = basket_height / num_of_layers;
  for (i = [0:(num_of_layers-1)])
    translate([0, 0, i * layer_thickness])
    linear_extrude(layer_thickness + epsilon)
    bulged_shape(basket_radius, bulge, num_of_rods, thickness, i % 2 == 0);
}

module ring(circle_radius = 10, ring_radius = 1, z = 0, flat = 1) {
  rotate_extrude($fn = 360)
  translate([circle_radius - ring_radius, z, 0])
  scale([1/flat,1,1])
  circle(r = ring_radius, $fn = 240);
}

module plate(radius = 10, height = 1, z = 0) {
  translate([0, 0, -height/2 + z])
  cylinder(h = height, r = radius, $fn = 360);
}

module rods(outer_radius = 10, rod_radius = 1, num_of_rods = 12, rod_height = 20, z = 0) {
  segment = 360 / num_of_rods;
  for (i = [0:(num_of_rods - 1)])
    rotate([0, 0, i * segment])
    translate([outer_radius, 0, z])
    cylinder(r = rod_radius, h = rod_height, $fn = 120);
}

module circular_woven_basket(
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

module put(x = 0, y = 0, z = 0, c = "gray") {
  color(c)
  translate([x, y, z]) 
  children();
}

color("#ffd090") circular_woven_basket(basket_radius, basket_height, rod_radius, num_of_rods, num_of_layers, thickness
, ring_radius);
