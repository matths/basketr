// partial_sums.test.scad
// Unit tests

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <partial_sums.scad>

// compute_and_append_partial_sum
assert(compute_and_append_partial_sum([0, 1], 2, 2, [0, 1, 2]) == [0, 1, 3]);
assert(compute_and_append_partial_sum([0, 1, 3], 4, 3, [0, 1, 2, 3, 4]) == [0, 1, 3, 7]);
assert(compute_and_append_partial_sum([], 1, 0, [1]) == [1]);

// partial_sums
assert(partial_sums([0,1,2,3,4,5]) == [0,1,3,6,10,15]);
assert(partial_sums([2,4,6,8,10]) == [2,6,12,20,30]);
assert(partial_sums([1]) == [1]);
assert(partial_sums([]) == []);
