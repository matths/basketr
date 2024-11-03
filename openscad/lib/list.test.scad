// list_equal.test.scad
// Unit tests

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

use <list.scad>

// list_equal
assert(list_equal([255, 0, 0], [255, 0, 0]));
assert(!list_equal([255, 0, 0], [255, 1, 0]));
assert(list_equal([50, 100], [50, 100]));

assert(list_equal([255, 0, 0], [255, 1, 0], 1));
assert(!list_equal([255, 0, 0], [255, 2, 0], 1));
assert(list_equal([10, 20, 30], [11, 21, 29], 1));

assert(list_equal([255, 0, 0], [255, 2, 0], 2));
assert(!list_equal([255, 0, 0], [255, 3, 0], 2));

assert(list_equal([255, 128, 64, 32], [255, 129, 65, 31], 1));
assert(!list_equal([255, 128, 64, 32], [255, 130, 65, 31], 1));

assert(list_equal([], []));

// tuple_at
assert(tuple_at(["#", "C", "F", "B", "E", "A", "0"], 3) == ["B", "E"]);
assert(tuple_at("#CFBEA0", 3) == ["B", "E"]);
