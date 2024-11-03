// circular/plate.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

module plate(radius = 10, height = 1, z = 0) {
  translate([0, 0, -height/2 + z])
  cylinder(h = height, r = radius, $fn = 360);
}

module circular_plate(radius = 10, height = 1, z = 0) {
  plate(radius, height, z);
}
