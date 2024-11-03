// math.scad
// math utility functions

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

function sum(list, c = 0) = 
  c < len(list) - 1
    ? list[c] + sum(list, c + 1) 
    : list[c];
