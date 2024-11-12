// sine_wave_path.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <list_fp.scad>
include <point.scad>
include <normal_vector.scad>

TAU = 360;

sine_wave_path = function(points, amplitude, frequency, start=TAU/4)
  let(length = len(points))
  map(points, function(curr, i, l)
    let(next = points[(i + 1) % length])
    let(prev = points[(i - 1 + length) % length])
    let(n = normal_vector(prev, curr, next))
    let(sine_offset = amplitude * sin((i / length) * frequency * TAU + start))
    plus(curr, point(n.x * sine_offset, n.y * sine_offset))
  )
;
