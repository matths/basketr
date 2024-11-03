// color/hsl_to_rgb.test.scad
// Unit tests

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

use <hsl_to_rgb.scad>
use <../list.scad>

// hsl_to_rgb
assert(hsl_to_rgb([0, 100, 50]) == [255, 0, 0]);
assert(hsl_to_rgb([120, 100, 50]) == [0, 255, 0]);
assert(hsl_to_rgb([240, 100, 50]) == [0, 0, 255]);
assert(list_equal(hsl_to_rgb([100, 86, 59]), [120, 240, 60], 1));
