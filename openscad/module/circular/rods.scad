// circular/rods.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

// Parts derived from Parametric Woven Structure
// Copyright 2019 Zoé Böle (zoe1337)
// Licensed under the BSD 2-Clause License
// https://www.thingiverse.com/thing:3600485
// https://www.reddit.com/r/3Dprinting/comments/bjg15c/comment/em8awxe/
// (Zoé Böle, zoe1337, https://chaos.social/@uint8_t, https://github.com/zoe1337)

module rods(outer_radius = 10, rod_radius = 1, num_of_rods = 12, rod_height = 20, z = 0) {
  segment = 360 / num_of_rods;
  for (i = [0:(num_of_rods - 1)])
    rotate([0, 0, i * segment])
    translate([outer_radius, 0, z])
    cylinder(r = rod_radius, h = rod_height, $fn = 120);
}

module circular_rods(outer_radius = 10, rod_radius = 1, num_of_rods = 12, rod_height = 20, z = 0) {
  rods(outer_radius, rod_radius, num_of_rods, rod_height, z);
}
