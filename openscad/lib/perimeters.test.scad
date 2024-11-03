// perimeters.test.scad
// Unit tests

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <perimeters.scad>

// perimeter_of_circle
dataset_perimeter_of_circle = [
  [0, 0],
  [1, 2 * PI],
  [2, 4 * PI]
];

for (data = dataset_perimeter_of_circle) {
  radius = data[0];
  expected = data[1];
  assert(perimeter_of_circle(radius) == expected);
};

// perimeter_of_rect
dataset_perimeter_of_rect = [
  [0, 0, 0],
  [1, 1, 4],
  [2, 4, 12]
];

for (data = dataset_perimeter_of_rect) {
  width = data[0];
  height = data[1];
  expected = data[2];
  assert(perimeter_of_rect(width, height) == expected);
};

// perimeter_of_rounded_rect
dataset_perimeter_of_rounded_rect = [
  [0, 0, 0, 0],
  [1, 1, 0, 4],
  [2, 4, 0, 12],
  [2, 4, 1, 12 + 2 * PI - 8],
  [2, 4, 2, 12 + 4 * PI - 16]
];

for (data = dataset_perimeter_of_rounded_rect) {
  width = data[0];
  height = data[1];
  cornerRadius = data[2];
  expected = data[3];
  assert(perimeter_of_rounded_rect(width, height, cornerRadius) == expected);
};
