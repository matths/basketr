// offset_path.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <list_fp.scad>
include <point.scad>
include <normal_vector.scad>

offset_path = function (points, offset)
  let(length = len(points))
  map(points, function(curr,i,l)
    let(next = points[(i + 1) % length])
    let(prev = points[(i - 1 + length) % length])
    let(n = normal_vector(prev, curr, next))
    plus(curr, point(n.x * offset, n.y * offset))
  )
;
