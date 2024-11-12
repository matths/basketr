// render_modules.scad
// usage: open scad file in OpenSCAD while editing in Visual Studio Code

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

use <module/modules_circular.scad>
use <module/modules_rectangular.scad>

rotate([0,0,90])
{
  translate([30,  15, 0]) text("Basketr", font = "Arial", size=6, halign = "center",  $fn = 180);
  translate([15,   2, 0]) text("circular", font = "Arial", size=4, halign = "center",  $fn = 180);
  translate([45,   2, 0]) text("rectangular", font = "Arial", size=4, halign = "center",  $fn = 180);

  translate([-2,  -17, 0]) text("plate", font = "Arial", size=5, halign = "right",  $fn = 180);
  translate([-2,  -42, 0]) text("ring", font = "Arial", size=5, halign = "right", $fn = 180);
  translate([-2,  -67, 0]) text("rods", font = "Arial", size=5, halign = "right", $fn = 180);
  translate([-2,  -92, 0]) text("bulged_shape", font = "Arial", size=5, halign = "right", $fn = 180);
  translate([-2, -117, 0]) text("weaved_layers", font = "Arial", size=5, halign = "right", $fn = 180);
  translate([-2, -142, 0]) text("woven_basket", font = "Arial", size=5, halign = "right", $fn = 180);
}

translate([0, 0, -2]) color("#666666") square([155,65], false);
translate([15, 15, 0]) circular_woven_basket();
translate([15, 45, 0]) rectangular_woven_basket();
