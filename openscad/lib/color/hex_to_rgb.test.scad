// color/hex_to_rgb.test.scad
// Unit tests

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

use <hex_to_rgb.scad>

// hex_digit_to_decimal
assert(hex_digit_to_decimal("0") == 0);
assert(hex_digit_to_decimal("A") == 10);
assert(hex_digit_to_decimal("F") == 15);

// hex_to_decimal
assert(hex_to_decimal(["F", "F"]) == 255);
assert(hex_to_decimal(["F", "0"]) == 240);
assert(hex_to_decimal(["0", "F"]) == 15);

// hex_to_rgb
assert(hex_to_rgb("#DE6449") == [222, 100, 73]);
assert(hex_to_rgb("#FF6400") == [255, 100, 0]);
