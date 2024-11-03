// circular/bulged_shape.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

// Parts derived from Parametric Woven Structure
// Copyright 2019 Zoé Böle (zoe1337)
// Licensed under the BSD 2-Clause License
// https://www.thingiverse.com/thing:3600485
// https://www.reddit.com/r/3Dprinting/comments/bjg15c/comment/em8awxe/
// (Zoé Böle, zoe1337, https://chaos.social/@uint8_t, https://github.com/zoe1337)

include <../../lib/points_along_circle.scad>;

module bulged_shape(radius, bulge, num_of_rods, thickness, opposite = true) {
  bulge = (opposite ? 1 : -1) * bulge;
  point_list_outside = points_along_circle(radius + thickness/2, num_of_rods * 60, bulge, num_of_rods);
  point_list_inside = points_along_circle(radius - thickness/2, num_of_rods * 60, bulge, num_of_rods);

  difference() {
    polygon(point_list_outside);
    polygon(point_list_inside);
  }
}

module circular_bulged_shape(radius, bulge, num_of_rods, thickness, opposite = true) {
  bulged_shape(radius, bulge, num_of_rods, thickness, opposite);
}
