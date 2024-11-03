// render_baskets.scad
// usage: open scad file in OpenSCAD while editing in Visual Studio Code

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

use <module/circular/woven_basket.scad>
use <module/rectangular/woven_basket.scad>
use <module/put.scad>

c = "#ffd090";
put(-50,  0,  0, c) circular_woven_basket(45, 90, 1, 16, 9);
put( 50,  0,  0, c) rectangular_woven_basket(120 , 90, 90, 24, 1, 15, 9);
