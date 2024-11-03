// list_fp.test.scad
// Unit tests of common functional programming methods for lists
// usage: open list_fp.test.scad in OpenSCAD and see no assertions fail

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <list_fp.scad>;

// range
dataset_range = [
  [0, 0, []],
  [1, 0, [0]],
  [5, 0, [0, 1, 2, 3, 4]],
  [3, 2, [2, 3, 4]]
];

for (data = dataset_range) {
  length = data[0];
  start = data[1];
  expected = data[2];
  assert(range(length, start) == expected);
};

// false_when_empty_list
dataset_false_when_empty_list = [
  [[1, 2, 3], [1, 2, 3]],
  [["apple", "banana", "cherry"], ["apple", "banana", "cherry"]],
  [[], false]
];

for (data = dataset_false_when_empty_list) {
  list = data[0];
  expected = data[1];
  assert(false_when_empty_list(list) == expected);
};

// index_of
dataset_index_of = [
  [[1, 2, 3], 2, 1],
  [["apple", "banana", "cherry"], "cherry", 2],
  [[], 0, false]
];

for (data = dataset_index_of) {
  list = data[0];
  itm = data[1];
  expected = data[2];
  assert(index_of(list, itm) == expected);
};

// includes
dataset_includes = [
  [[1, 2, 3], 2, true],
  [["apple", "banana", "cherry"], "orange", false],
  [[], 0, false]
];

for (data = dataset_includes) {
  list = data[0];
  itm = data[1];
  expected = data[2];
  assert(includes(list, itm) == expected);
};

// first, last
dataset_first_last = [
  [[1, 2, 3], 1, 3],
  [[-1, -2, -3], -1, -3],
  [["apple", "banana", "cherry"], "apple", "cherry"],
  [[], false, false]
];

for (data = dataset_first_last) {
  list = data[0];
  expected_first = data[1];
  expected_last = data[2];
  assert(first(list) == expected_first);
  assert(last(list) == expected_last);
};

// map
dataset_map = [
  [[1, 2, 3], function (x,i,l) x * 2, [2, 4, 6]],
  [["a", "b", "c"], function (x,i,l) str(x, i), ["a0", "b1", "c2"]],
  [[], function (x,i,l) x * 2, []]
];

for (data = dataset_map) {
  list = data[0];
  func = data[1];
  expected = data[2];
  assert(map(list, func) == expected);
};

// reduce
dataset_reduce = [
  [[1, 2, 3], function (acc, cur, i, l) acc + cur, 0, 6],
  [["a", "b", "c"], function (acc, cur, i, l) str(acc, cur), "", "abc"],
  [[], function (acc, cur, i, l) acc + cur, "initial", "initial"]
];

for (data = dataset_reduce) {
  list = data[0];
  func = data[1];
  initial = data[2];
  expected = data[3];
  assert(reduce(list, func, initial) == expected);
};

// filter
dataset_filter = [
  [[1, 2, 3], function (x) x % 2 == 0, [2]],
  [["apple", "banana", "cherry"], function (x) len(x) > 5, ["banana", "cherry"]],
  [[], function (x) x > 0, []],
  [[1, -2, 3, -4, 5], function (x) x > 0, [1, 3, 5]]
];

for (data = dataset_filter) {
  list = data[0];
  func = data[1];
  expected = data[2];
  assert(filter(list, func) == expected);
};

// find_index
dataset_find_index = [
  [[1, 2, 3], function (x) x == 2, 1],
  [[1, 2, 3], function (x) x == 4, undef],
  [["a", "b", "c"], function (x) x == "b", 1],
  [[], function (x) x == 1, undef]
];

for (data = dataset_find_index) {
  list = data[0];
  predicate = data[1];
  expected = data[2];
  assert(find_index(list, predicate) == expected);
};
