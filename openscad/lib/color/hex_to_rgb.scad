// color/hex_to_rgb.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

use <../list.scad>
use <../math.scad>
use <../string.scad>

function hex_digit_to_decimal(hex_digit) =
  let(hex_digits = "0123456789ABCDEF")
  search(str_to_upper(hex_digit), hex_digits)[0];

function hex_to_decimal(hex_values) =
  let(len = len(hex_values))
  sum([
    for (i = [0:len-1])
      hex_digit_to_decimal(hex_values[i]) * pow(16, len - i - 1)
  ]);

function hex_to_rgb(hex) = [
  hex_to_decimal(tuple_at(hex, 1)),
  hex_to_decimal(tuple_at(hex, 3)),
  hex_to_decimal(tuple_at(hex, 5))
];
