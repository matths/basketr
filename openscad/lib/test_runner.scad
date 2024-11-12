// test_runner.scad
// usage: open test_runner.scad in OpenSCAD to run all unit tests at once

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <color/hex_to_rgb.scad>
include <color/rgb_to_hex.scad>
include <color/hsl_to_rgb.scad>
include <color/rgb_to_hsl.scad>
include <color/darken.scad>
include <color/lighten.scad>
include <circle.test.scad>
include <list_fp.test.scad>
include <list.test.scad>
include <math.test.scad>
include <normal_vector.test.scad>
include <offset_path.test.scad>
include <sine_wave_path.test.scad>
include <partial_sums.test.scad>
include <perimeters.test.scad>
include <point.test.scad>
include <string.test.scad>
