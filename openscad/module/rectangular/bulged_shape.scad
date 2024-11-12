// rectangular/bulged_shape.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <../../lib/points_along_rounded_rect.scad>;
include <../../lib/offset_path.scad>;
include <../../lib/sine_wave_path.scad>;
include <../../lib/point.scad>;
include <../../lib/list_fp.scad>;

module bulged_shape(basket_length, basket_width, corner_radius, num_of_rods, bulge, thickness, opposite = true) {
  bulge = (opposite ? 1 : -1) * bulge;

  point_list = map(
    points_along_rounded_rect(basket_width, basket_length, corner_radius, num_of_rods * (1 + 24)),
    function (p, i, l) minus(p, point(basket_width / 2, basket_length / 2))
  );
  point_list_bulged = sine_wave_path(point_list, bulge,num_of_rods/2);

  point_list_outside = offset_path(point_list_bulged, thickness/2);
  point_list_inside = offset_path(point_list_bulged, -thickness/2);
  
  difference() {
    polygon(point_list_outside);
    polygon(point_list_inside);
  }
}

module rectangular_bulged_shape(basket_length, basket_width, corner_radius, num_of_rods, bulge, thickness, opposite = true) {
  bulged_shape(basket_length, basket_width, corner_radius, num_of_rods, bulge, thickness, opposite);
}
