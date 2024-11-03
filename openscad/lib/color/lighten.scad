// color/lighten.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

use <hsl_to_rgb.scad>
use <rgb_to_hsl.scad>
use <hex_to_rgb.scad>
use <rgb_to_hex.scad>

function lighten(hex, percentage = 0.1) =
  let(
    rgb = hex_to_rgb(hex),
    hsl = rgb_to_hsl(rgb),
    new_l = min(round(hsl[2] * (1 + percentage)), 100),
    new_rgb = hsl_to_rgb([hsl[0], hsl[1], new_l]),
    new_hex = rgb_to_hex(new_rgb)
  )
  new_hex;
