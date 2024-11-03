// modules_circular.scad
// usage: open scad file in OpenSCAD while editing in Visual Studio Code

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

use <put.scad>
use <../lib/color/lighten.scad>

use <circular/plate.scad>
use <circular/ring.scad>
use <circular/rods.scad>
use <circular/bulged_shape.scad>
use <circular/weaved_layers.scad>
use <circular/woven_basket.scad>

module circular_woven_basket(col = "#2233cc") {
  put(  0, 0, c=lighten(col, 0.3)) plate(10, 1, 0);
  put( 25, 0, c=lighten(col, 0.6)) ring(10, 0.5, 0);
  put( 50, 0, c=lighten(col, 0.3)) rods(9, 0.5, 24, 10, 0);
  put( 75, 0, c=lighten(col, 0.6)) bulged_shape(9, 0.5, 24, 0.5);
  put( 75, 0, c=lighten(col, 0.3)) bulged_shape(9, 0.5, 24, 0.5, false);
  put(100, 0, c=lighten(col, 0.6)) weaved_layers(9, 0.5, 24, 0.25, 10);
  put(125, 0, c=lighten(col, 0.3)) woven_basket(9, 15, 0.25, 12, 7, 0.1, 0.4);
}
