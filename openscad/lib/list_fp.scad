// list_fp.scad
// Implementation of common functional programming methods for lists
// usage: add "include <list_fp.scad>;" to the top of your OpenSCAD source code

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

range = function (length, start = 0)
  length == 0 ? [] : [for (i = [start:start + length - 1]) i]
;

false_when_empty_list = function (val) val == [] ? false : val;

index_of = function (list,itm)
  assert(is_list(list))
  false_when_empty_list(search([itm], list)[0])
;

includes = function (list,itm)
  assert(is_list(list))
  index_of(list,itm) == false ? false : true
;

first = function (list)
  assert(is_list(list))
  len(list) > 0
    ? list[0]
    : false
;

last = function (list)
  assert(is_list(list))
  len(list) > 0
    ? list[len(list) - 1]
    : false
;

map = function (list, func)
  assert(is_list(list))
  len(list) > 0
    ? [for (index=[0:len(list)-1]) func(list[index], index, list)]
    : []
;

reduce = function (list, func, initial, index = 0)
  assert(is_list(list))
  len(list) > index
    ? reduce(list, func, func(initial, list[index], index, list), index + 1)
    : initial
;

filter = function (list, func)
  assert(is_list(list))
  [for (item=list) if (func(item)) item]
;

find_index = function(list, predicate, index = 0)
  assert(is_list(list))
  len(list) > index
    ? predicate(list[index]) ? index : find_index(list, predicate, index + 1)
    : undef
;
