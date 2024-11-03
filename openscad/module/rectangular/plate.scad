// rectangular/plate.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

module plate(
  length = 24,
  width = 16,
  radius = 2,
  height = 1,
  z = 0
) {
  v = width/2 - radius;
  h = length/2 - radius;

  translate([0, 0, -height/2 + z])
  hull($fn=120) {
    translate([ v, h, 0]) cylinder(h=height, r=radius);
    translate([-v, h, 0]) cylinder(h=height, r=radius);
    translate([-v,-h, 0]) cylinder(h=height, r=radius);
    translate([ v,-h, 0]) cylinder(h=height, r=radius);
  };
}

module rectangular_plate(
  length = 24,
  width = 16,
  radius = 2,
  height = 1,
  z = 0
) {
  plate(length, width, radius, height, z);
}
