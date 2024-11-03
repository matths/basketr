// color/lighten.test.scad
// Unit tests

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

use <lighten.scad>

// lighten
assert(lighten("#000000", 0.2) == "#000000");
assert(lighten("#FF0000", 0.1) == "#FF1A1A");
assert(lighten("#0000FF", 0.15) == "#2424FF");
assert(lighten("#808080", 0.3) == "#A6A6A6");
assert(lighten("#ADD8E6", 0.1) == "#CCE7EF");
assert(lighten("#333333", 0.5) == "#4D4D4D");
