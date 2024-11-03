// offset_path.test.scad
// Unit tests

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <offset_path.scad>
include <string.scad>

// get_normal_vector
dataset_get_normal_vector = [
  [point(0,0), point(1,0), point(2,0), point(0,-1)],
  [point(0,0), point(1,0), point(1,1), point(0.5,-0.5)],
  [point(0,0), point(1,1), point(2,2), point(sqrt(0.5), -sqrt(0.5))],
  [point(0,0), point(0,0), point(0,0), point(0/0,0/0)]
];

for (data = dataset_get_normal_vector) {
  prev = data[0];
  curr = data[1];
  next = data[2];
  expected = data[3];
  assert(str_equal(get_normal_vector(prev, curr, next), expected));
};

// offset_path
dataset_offset_path = [
  [[point(0,0), point(1,0), point(1,1), point(0,1)], 0.2, [point(-0.1, -0.1), point(1.1, -0.1), point(1.1, 1.1), point(-0.1, 1.1)]],
  [[point(0,0), point(1,0), point(1,1), point(0,1)], 0, [point(0,0), point(1,0), point(1,1), point(0,1)]],
  [[point(0,0), point(1,0), point(1,1), point(0,1)], -0.2, [point(0.1, 0.1), point(0.9, 0.1), point(0.9, 0.9), point(0.1, 0.9)]],
  [
    [point(0,0), point(0.2,0), point(0.4,0), point(0.6,0), point(0.8,0), point(1,0), point(1,1), point(0,1)],
    -0.2,
    [point(0.1,0.1), point(0.2,0.2), point(0.4,0.2), point(0.6,0.2), point(0.8,0.2), point(0.9, 0.1), point(0.9, 0.9), point(0.1, 0.9)]
  ]
];

for (data = dataset_offset_path) {
  points = data[0];
  offset = data[1];
  expected = data[2];
  assert(str_equal(offset_path(points, offset), expected));
};