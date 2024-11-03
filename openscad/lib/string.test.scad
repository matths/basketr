// str_equal.test.scad
// Unit tests

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <string.scad>

// str_to_upper
assert(str_to_upper("Hello world!") == "HELLO WORLD!");

// str_to_lower
assert(str_to_lower("HELLO World!") == "hello world!");

// str_equal
a = 0.707107;
b = "0.707107";
c = sqrt(0.5);

assert((a == b) == false);
assert((a == c) == false);
assert((b == c) == false);

assert(str_equal(a, b) == true);
assert(str_equal(a, c) == true);
assert(str_equal(b, c) == true);
