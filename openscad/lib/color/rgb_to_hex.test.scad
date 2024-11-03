// color/rgb_to_hex.test.scad
// Unit tests

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

use <rgb_to_hex.scad>

// decimal_to_hex
assert(decimal_to_hex(255) == "FF");
assert(decimal_to_hex(240) == "F0");
assert(decimal_to_hex(15) == "0F");
assert(decimal_to_hex(0) == "00");

// rgb_to_hex
assert(rgb_to_hex([222, 100, 73]) == "#DE6449");
assert(rgb_to_hex([255, 100, 0]) == "#FF6400");
