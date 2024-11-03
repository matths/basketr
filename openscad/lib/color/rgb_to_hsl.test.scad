// color/rgb_to_hsl.test.scad
// Unit tests

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

use <rgb_to_hsl.scad>
use <../list.scad>

// rgb_to_hsl
assert(rgb_to_hsl([255, 0, 0]) == [0, 100, 50]);
assert(rgb_to_hsl([0, 255, 0]) == [120, 100, 50]);
assert(rgb_to_hsl([0, 0, 255]) == [240, 100, 50]);
assert(list_equal(rgb_to_hsl([120, 240, 60]), [100, 86, 59], 1));
