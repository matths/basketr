// point.test.scad
// Unit tests for utility functions for 2D points / vectors
// usage: open point.test.scad in OpenSCAD and see no assertions fail

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <point.scad>
include <string.scad>

// point
assert(point(1, 2) == [1, 2]);
assert(point(-1, -2) == [-1, -2]);
assert(point(0, 0) == [0, 0]);

// plus
assert(plus(point(1, 2), point(3, 4)) == point(4, 6));
assert(plus(point(-1, -2), point(3, 4)) == point(2, 2));
assert(plus(point(0, 0), point(0, 0)) == point(0, 0));

// minus
assert(minus(point(1, 2), point(3, 4)) == point(-2, -2));
assert(minus(point(-1, -2), point(3, 4)) == point(-4, -6));
assert(minus(point(0, 0), point(0, 0)) == point(0, 0));

// multiply
assert(multiply(point(1, 2), 2) == point(2, 4));
assert(multiply(point(-1, -2), -2) == point(2, 4));
assert(multiply(point(0, 0), 10) == point(0, 0));

// swap
assert(swap(point(1, 2)) == point(2, 1));
assert(swap(point(-1, -2)) == point(-2, -1));
assert(swap(point(0, 0)) == point(0, 0));

// length
assert(length(point(0, 1)) == 1);
assert(length(point(1, 0)) == 1);
assert(length(point(3, 4)) == 5);
assert(str_equal(length(point(2, 2)), 2.82843));
