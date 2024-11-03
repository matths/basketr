// modules_rectangular.scad
// usage: open scad file in OpenSCAD while editing in Visual Studio Code

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

use <put.scad>
use <../lib/color/lighten.scad>

use <rectangular/plate.scad>
use <rectangular/ring.scad>
use <rectangular/rods.scad>
use <rectangular/bulged_shape.scad>
use <rectangular/weaved_layers.scad>
use <rectangular/woven_basket.scad>

module rectangular_woven_basket(col = "#448855") {
  put(  0, 0, c=lighten(col, 0.3)) plate(24, 16, 4, 1, 0);
  put( 25, 0, c=lighten(col, 0.6)) ring(24, 16, 4, 0.5, 0);
  put( 50, 0, c=lighten(col, 0.3)) rods(24, 16, 4, 36, 0.5, 10, 0);
  put( 75, 0, c=lighten(col, 0.6)) bulged_shape(24, 16, 4, 36, 0.5, 0.5);
  put( 75, 0, c=lighten(col, 0.3)) bulged_shape(24, 16, 4, 36, 0.5, 0.5, false);
  put(100, 0, c=lighten(col, 0.6)) weaved_layers(36, 0.5, 24, 16, 4, 0.5, 10, 0);
  put(125, 0, c=lighten(col, 0.3)) woven_basket(24, 16, 15, 16, 0.25, 4, 7, 0.4, 0.1);
}
