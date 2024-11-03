// color/rgb_to_hsl.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

function calc_hue(r, g, b, chroma, max_value) =
    max_value == r
      ? (g - b) / chroma + (g < b ? 6 : 0)
      : max_value == g
        ? (b - r) / chroma + 2
        :(r - g) / chroma + 4;

function hsl_scale(hue, sat, lum) = [
  round(hue * 60), // °
  round(sat * 100), // %
  round(lum * 100) // %
];

function rgb_to_hsl(rgb) =
  let(
    r = rgb[0] / 255,
    g = rgb[1] / 255,
    b = rgb[2] / 255
  )
  let(
    max_value = max(r, g, b),
    min_value = min(r, g, b)
  )
  let(lum = (max_value + min_value) / 2)
  (max_value == min_value)
    ? hsl_scale(0, 0, lum)
    :
    let(chroma = max_value - min_value)
    let(sat = chroma / (1 - abs(2 * lum - 1)))
    hsl_scale(
      calc_hue(r, g, b, chroma, max_value),
      sat,
      lum
    );
