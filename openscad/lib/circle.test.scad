// circle.test.scad
// Unit tests for utility functions for circle calculation
// usage: open circle.test.scad in OpenSCAD and see no assertions fail

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <circle.scad>
include <string.scad>

// sinr
assert(str_equal(sinr(0), 0));
assert(str_equal(sinr(PI/2), 1));
assert(str_equal(sinr(PI), 0));
assert(str_equal(sinr(3*PI/2), -1));
assert(str_equal(sinr(2*PI), 0));

// cosr
assert(str_equal(cosr(0), 1));
assert(str_equal(cosr(PI/2), 0));
assert(str_equal(cosr(PI), -1));
assert(str_equal(cosr(3*PI/2), 0));
assert(str_equal(cosr(2*PI), 1));

// unit_circle_point_clockwise
assert(str_equal(unit_circle_point_clockwise(0), point(0, -1)));
assert(str_equal(unit_circle_point_clockwise(PI/4), point(sqrt(0.5), -sqrt(0.5))));
assert(str_equal(unit_circle_point_clockwise(PI/2), point(1, 0)));
assert(str_equal(unit_circle_point_clockwise(PI), point(0, 1)));
assert(str_equal(unit_circle_point_clockwise(3*PI/2), point(-1, 0)));
assert(str_equal(unit_circle_point_clockwise(2*PI), point(0, -1)));
