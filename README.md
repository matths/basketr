# Basketr

Basketr is the source code repository how to create beautiful woven baskets, either with a circular or rounded rectangular base shape.

![Printed real baskets](/images/basketr_real_prints_small.jpg)
![Rendered print models](/images/basketr_print_models_small.jpg)

## Table of Contents

- [Introduction](#introduction)
- [Svelte components](#svelte-components)
- [OpenSCAD modules](#openscad-modules)
- [Contributing](#contributing)
- [License](#license)
- [Links](#links)

## Introduction

This repository provides useful starting points for the development of [3D models with OpenSCAD](#openscad-modules) using the example of **woven baskets**. As this is based on extruding 2D shapes, it also contains the source code for creating these [2D shapes with Svelte/JS and SVG](#svelte-components). If you want to learn more about this approach, you can also read this [blog article](https://matthias.dittgen.name/blog/woven-basket).

## OpenSCAD modules

Even if the 2D functions are the basis, we start here with the functions for the polygon shapes that have been converted from Svelte/Javascript into OpenSCAD modules to be extruded into the woven basket.

No matter which base shape we use, either circular or rectangular, the basket is composed out of a plate, rings, rods and the weaved layers.

The modules are fully parameterised and all values can be changed and baskets with different dimensions, heights, bulges, number of rods, etc. can be created. Do not forget to share your builds with us.

![OpenSCAD modules](/images/basketr_3d_openscad_modules.jpg)

### Usage

We prefer using Visual Studio Code with OpenSCAD plugins for coding and OpenSCAD nightly builds for rendering. Just open `openscad/render_baskets.scad` to start with your own basket creations or check out `openscad/render_modules.scad` to get an understanding of the building blocks for the final basket.

Remember, the mathematical functions to get the polygon points along the shapes pathes were developed in Javascript first. Because Javascript offers more language details eg. to use basic functional programming with map and reduce, we came up with a bunch of helper or util functions.

### Unit Tests

To ensure the quality of the underlying functions, unit tests have been written and have been used to make sure conversion from Javascript did work. Each function has a file with the implementation and another file with the corresponding unit test. The unit tests can be found in the `openscad/lib/` folder and the test runner can be found in `openscad/lib/testrunner.scad`. If no errors occur when opening this file in OpenSCAD, all tests are considered "green".

## Svelte components

![Svelte components](/images/basketr_2d_svelte_components.jpg)

While the circular basket was inspired by the work of @zoe1337 and her Thingiverse model [Parametric Woven Structure](https://www.thingiverse.com/thing:3600485) the rectangular shapes was built from scratch. Several mathematical functions were developed to solve this problem, mainly the `points_along_rounded_rect()`and the `offset_path()`.

So in addition to the 3D models, there is a Svelte app in the `svelte/` folder that can be used to visualize the points of the rounded rectangle and how to make the pathes look wooven.

## Usage

To run the Svelte app, follow these steps:

```bash
cd svelte
npm install
npm run dev
# [Meta] + Click the URL to open the Svelte app in your browser.
```

## Contributing

By sharing this code, we hope to provide a useful resource for those looking to learn and experiment with OpenSCAD as well as with Svelte and SVG.

If you would like to contribute to this project, feel free to submit a pull request with your changes. Please make sure to follow the current code style and include some comments to explain your changes.

## License

This project is licensed under the MIT License while attributed portions of this project are derived from code under the BSD License - see the [LICENSE](LICENSE) file for details.

## Links

* [OpenSCAD](https://openscad.org/)
* [Svelte](https://svelte.dev/)
* [Javascript](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
* [SVG](https://developer.mozilla.org/en-US/docs/Web/SVG)
