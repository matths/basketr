// rectangular/rods.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <../../lib/list_fp.scad>;
include <../../lib/point.scad>;
include <../../lib/points_along_rounded_rect.scad>;

module rods(length = 24, width = 16, corner_radius = 2, number_of_rods = 12, rod_radius = 1, rod_height = 10, z = 0) {
  rod_points = map(
    points_along_rounded_rect(width, length, corner_radius, number_of_rods),
    function (p, i, l) minus(p, point(width / 2, length / 2))
  );
  for (rod_point = rod_points)
    translate([rod_point.x, rod_point.y, z])
    cylinder(r = rod_radius, h = rod_height, $fn = 240);
}

module rectangular_rods(length = 24, width = 16, corner_radius = 2, number_of_rods = 12, rod_radius = 1, rod_height = 10, z = 0) {
  rods(length, width, corner_radius, number_of_rods, rod_radius, rod_height, z);
}
