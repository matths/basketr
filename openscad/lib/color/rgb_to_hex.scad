// color/rgb_to_hex.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

function decimal_to_hex(dec) = 
  let(
    hex_digits = "0123456789ABCDEF",
    hex = floor(dec / 16),
    rem = dec % 16
  )
  str(hex_digits[hex], hex_digits[rem]);

function rgb_to_hex(rgb) = str(
  "#",
  decimal_to_hex(rgb[0]), 
  decimal_to_hex(rgb[1]), 
  decimal_to_hex(rgb[2])
);
