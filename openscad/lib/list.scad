// list.scad
// list utility functions

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

function list_equal(list1, list2, tolerance = 0, index = 0) =
  index == len(list1)
    ? true
    : abs(list1[index] - list2[index]) <= tolerance &&
      list_equal(list1, list2, tolerance, index + 1);

function tuple_at(list, i) = [
  list[i],
  list[i + 1]
];
