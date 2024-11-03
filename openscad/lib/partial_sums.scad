// partial_sums.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <list_fp.scad>

compute_and_append_partial_sum = function (prev, curr, i, l)
  concat(prev, [curr + (i > 0 ? prev[i - 1] : 0)])
;

partial_sums = function (list)
  assert(is_list(list))
  reduce(list, compute_and_append_partial_sum, [])
;
