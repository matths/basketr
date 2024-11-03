// color/hsl_to_rgb.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

function hsl_to_rgb(hsl) =
  let(
    hue = hsl[0] / 360,
    sat = hsl[1] / 100,
    lum = hsl[2] / 100
  )
  let(
    chroma = (1 - abs(2 * lum - 1)) * sat,
    hue_mod = hue * 6,
    intermediate_value = chroma * (1 - abs(hue_mod % 2 - 1)),
    match_lightness = lum - chroma / 2,
    rgb1 = hue_mod < 1 ? [chroma, intermediate_value, 0] :
      hue_mod < 2 ? [intermediate_value, chroma, 0] :
      hue_mod < 3 ? [0, chroma, intermediate_value] :
      hue_mod < 4 ? [0, intermediate_value, chroma] :
      hue_mod < 5 ? [intermediate_value, 0, chroma] :
      [chroma, 0, intermediate_value]
  )
  [
    round((rgb1[0] + match_lightness) * 255),
    round((rgb1[1] + match_lightness) * 255),
    round((rgb1[2] + match_lightness) * 255)
  ];

