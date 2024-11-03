// circular/ring.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

module ring(circle_radius = 10, ring_radius = 1, z = 0, flat = 1) {
  rotate_extrude($fn = 360)
  translate([circle_radius - ring_radius, z, 0])
  scale([1/flat,1,1])
  circle(r = ring_radius, $fn = 240);
}

module circular_ring(circle_radius = 10, ring_radius = 1, z = 0, flat = 1) {
  ring(circle_radius, ring_radius, z, flat);
}
