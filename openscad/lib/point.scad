// point.scad
// Utility functions for 2D points / vectors
// usage: add "include <point.scad>;" to the top of your OpenSCAD source code

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

point = function (x, y) [x, y];

plus = function (a, b) point(a.x + b.x, a.y + b.y);

minus = function (a, b) point(a.x - b.x, a.y - b.y);

multiply = function (a, b) point(a.x * b, a.y * b);

swap = function (p) point(p.y, p.x);

length = function (p) sqrt(p.x * p.x + p.y * p.y);
