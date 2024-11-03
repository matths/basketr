// color/darken.test.scad
// Unit tests

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

use <darken.scad>

// darken
assert(darken("#FFFFFF", 0.1) == "#E6E6E6");
assert(darken("#FF0000", 0.2) == "#CC0000");
assert(darken("#0000FF", 0.15) == "#0000DB");
assert(darken("#808080", 0.3) == "#595959");
assert(darken("#ADD8E6", 0.1) == "#8EC9DC");
assert(darken("#333333", 0.5) == "#1A1A1A");
