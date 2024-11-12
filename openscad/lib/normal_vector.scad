// normal_vector.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <point.scad>

normal_vector = function (prev, curr, next)
  let(delta1 = minus(curr, prev))
  let(delta2 = minus(next, curr))
  let(len1 = length(delta1))
  let(len2 = length(delta2))
  multiply(
    point(
      delta1.y / len1 + delta2.y / len2,
      -delta1.x / len1 - delta2.x / len2
    ), 1/2
  )
;
