// circle.scad
// Utility functions for circle calculation
// usage: add "include <circle.scad>;" to the top of your OpenSCAD source code

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <point.scad>

sinr = function (rad) sin(rad * 180 / PI);
cosr = function (rad) cos(rad * 180 / PI);

unit_circle_point_clockwise = function (angle)
  point(sinr(angle), -cosr(angle))
;
