// sine_wave_path.test.scad
// Unit tests

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <sine_wave_path.scad>
include <string.scad>

// sine_wave_path
dataset_sine_wave_path = [
  [[point(0, 0), point(1, 0), point(1, 1), point(0, 1)], 0, 5, 0, [
    point(0, 0), point(1, 0), point(1, 1), point(0, 1)
  ]],

  [[point(0, 0), point(1, 0), point(1, 1), point(0, 1)], 5, 0, 0, [
    point(0, 0), point(1, 0), point(1, 1), point(0, 1)
  ]],

  [[point(0, 0), point(1, 0), point(1, 1), point(0, 1)], 8, 1, TAU / 4, [
    point(-4, -4), point(1, 0), point(-3, -3), point(0, 1)
  ]],

  [[point(0, 0), point(1, 0), point(1, 1), point(0, 1)], 8, 1, TAU / 2, [
    point(0, 0), point(-3, 4), point(1, 1), point(-4, 5)
  ]],
];

for (data = dataset_sine_wave_path) {
  points = data[0];
  amplitude = data[1];
  frequency = data[2];
  start = data[3];
  expected = data[4];
  actual = sine_wave_path(points, amplitude, frequency, start);
  assert(str_equal(actual, expected));
}
