// math.test.scad
// Unit tests

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

use <math.scad>

// sum
assert(sum([0,1,2,3]) == 6);
assert(sum([3, -3]) == 0);
