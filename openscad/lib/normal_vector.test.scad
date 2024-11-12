// normal_vector.test.scad
// Unit tests

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <normal_vector.scad>
include <string.scad>

// get_normal_vector
dataset_normal_vector = [
  [point(0,0), point(1,0), point(2,0), point(0,-1)],
  [point(0,0), point(1,0), point(1,1), point(0.5,-0.5)],
  [point(0,0), point(1,1), point(2,2), point(sqrt(0.5), -sqrt(0.5))],
  [point(0,0), point(0,0), point(0,0), point(0/0,0/0)]
];

for (data = dataset_normal_vector) {
  prev = data[0];
  curr = data[1];
  next = data[2];
  expected = data[3];
  assert(str_equal(normal_vector(prev, curr, next), expected));
};
