// points_along_circle.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

// Parts derived from Parametric Woven Structure
// Copyright 2019 Zoé Böle (zoe1337)
// Licensed under the BSD 2-Clause License
// https://www.thingiverse.com/thing:3600485
// https://www.reddit.com/r/3Dprinting/comments/bjg15c/comment/em8awxe/
// (Zoé Böle, zoe1337, https://chaos.social/@uint8_t, https://github.com/zoe1337)


include <list_fp.scad>;

function point_bulged_circle (radius, angle, bulge, number_of_rods) =
  (radius - bulge * cos(angle * number_of_rods / 2)) * [cos(angle), sin(angle)]
;

function points_along_circle (radius, number_of_segments, bulge, number_of_rods) =
  map(
    range(number_of_segments),
    function (num, i, l)
      point_bulged_circle(radius, num / number_of_segments * 360, bulge, number_of_rods)
  )
;
