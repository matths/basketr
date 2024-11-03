// rectangular/ring.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

module ring(
  length = 150,
  width = 100,
  corner_radius = 15,
  ring_radius = 5,
  z = 0
) {
  r = ring_radius;
  c = corner_radius - ring_radius;
  v = width/2 - c - r;
  h = length/2 - c - r;

  translate([0, 0, z])
  union() {
    translate([ v,  h, 0]) rotate([0, 0,   0]) rotate_extrude(angle=90, $fn = 240) translate([c, 0]) circle(r, $fn = 240);
    translate([-v,  h, 0]) rotate([0, 0,  90]) rotate_extrude(angle=90, $fn = 240) translate([c, 0]) circle(r, $fn = 240);
    translate([-v, -h, 0]) rotate([0, 0, 180]) rotate_extrude(angle=90, $fn = 240) translate([c, 0]) circle(r, $fn = 240);
    translate([ v, -h, 0]) rotate([0, 0, 270]) rotate_extrude(angle=90, $fn = 240) translate([c, 0]) circle(r, $fn = 240);

    translate([-(v+c), -h, 0]) rotate([90, 0, 180]) cylinder(r=r, h=2*h, $fn = 240);
    translate([ (v+c), -h, 0]) rotate([90, 0, 180]) cylinder(r=r, h=2*h, $fn = 240);
    translate([-v, -(h+c), 0]) rotate([90, 0,  90]) cylinder(r=r, h=2*v, $fn = 240);
    translate([-v,  (h+c), 0]) rotate([90, 0,  90]) cylinder(r=r, h=2*v, $fn = 240);
  }
}

module rectangular_ring(
  length = 150,
  width = 100,
  corner_radius = 15,
  ring_radius = 5,
  z = 0
) {
  ring(length, width, corner_radius, ring_radius, z);
}
