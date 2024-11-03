// perimeters.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

perimeter_of_circle = function (radius) 2 * PI * radius;

perimeter_of_rect = function (width, height) 2 * (width + height);

perimeter_of_rounded_rect = function (width, height, corner_radius)
  perimeter_of_circle(corner_radius) +
  perimeter_of_rect(width, height) - 8 * corner_radius
;
