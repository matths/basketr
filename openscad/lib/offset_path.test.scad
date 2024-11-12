// offset_path.test.scad
// Unit tests

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <offset_path.scad>
include <string.scad>

// offset_path
dataset_offset_path = [
  [[point(0,0), point(1,0), point(1,1), point(0,1)], 0.2, [
    point(-0.1, -0.1), point(1.1, -0.1), point(1.1, 1.1), point(-0.1, 1.1)
  ]],
  [[point(0,0), point(1,0), point(1,1), point(0,1)], 0, [
    point(0,0), point(1,0), point(1,1), point(0,1)
  ]],
  [[point(0,0), point(1,0), point(1,1), point(0,1)], -0.2, [
    point(0.1, 0.1), point(0.9, 0.1), point(0.9, 0.9), point(0.1, 0.9)
  ]],
  [[point(0,0), point(0.2,0), point(0.4,0), point(0.6,0), point(0.8,0), point(1,0), point(1,1), point(0,1)], -0.2, [
    point(0.1,0.1), point(0.2,0.2), point(0.4,0.2), point(0.6,0.2), point(0.8,0.2), point(0.9, 0.1), point(0.9, 0.9), point(0.1, 0.9)
  ]]
];

for (data = dataset_offset_path) {
  points = data[0];
  offset = data[1];
  expected = data[2];
  actual = offset_path(points, offset);
  assert(str_equal(actual, expected));
};
