/* [Basket Dimensions] */

// Length
basket_length = 100; // [10:1:300]

// Width
basket_width = 80; // [10:1:300]

// Height
basket_height = 80; // [10:1:200]

// Corner radius
corner_radius = 15; // [0:1:150]

/* [Other Properties] */

// Number of Rods
num_of_rods = 24; // [4:2:64]

// Rod radius
rod_radius = 1; // [0.4:0.2:8]

// Number of Layers
num_of_layers = 8; // [1:1:24]

// Layer thickness
thickness = 1; // [1:0.2:10]

// Ring radius
ring_radius = 1.8; // [0.4:0.2:5]

// Epsilon
epsilon = 0.1; // [0:0.1:1]

module __Customizer_Limit__ () {}  // Hide following assignments from Customizer.

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>
// This code is under MIT Licence.

range = function (length, start = 0)
  length == 0 ? [] : [for (i = [start:start + length - 1]) i]
;

map = function (list, func)
  assert(is_list(list))
  len(list) > 0
    ? [for (index=[0:len(list)-1]) func(list[index], index, list)]
    : []
;

reduce = function (list, func, initial, index = 0)
  assert(is_list(list))
  len(list) > index
    ? reduce(list, func, func(initial, list[index], index, list), index + 1)
    : initial
;

find_index = function(list, predicate, index = 0)
  assert(is_list(list))
  len(list) > index
    ? predicate(list[index]) ? index : find_index(list, predicate, index + 1)
    : undef
;

point = function (x, y) [x, y];

plus = function (a, b) point(a.x + b.x, a.y + b.y);

minus = function (a, b) point(a.x - b.x, a.y - b.y);

multiply = function (a, b) point(a.x * b, a.y * b);

swap = function (p) point(p.y, p.x);

length = function (p) sqrt(p.x * p.x + p.y * p.y);

sinr = function (rad) sin(rad * 180 / PI);
cosr = function (rad) cos(rad * 180 / PI);

unit_circle_point_clockwise = function (angle)
  point(sinr(angle), -cosr(angle))
;

compute_and_append_partial_sum = function (prev, curr, i, l)
  concat(prev, [curr + (i > 0 ? prev[i - 1] : 0)])
;

partial_sums = function (list)
  assert(is_list(list))
  reduce(list, compute_and_append_partial_sum, [])
;

perimeter_of_circle = function (radius) 2 * PI * radius;

perimeter_of_rect = function (width, height) 2 * (width + height);

perimeter_of_rounded_rect = function (width, height, corner_radius)
  perimeter_of_circle(corner_radius) +
  perimeter_of_rect(width, height) - 8 * corner_radius
;

get_normal_vector = function (prev, curr, next)
  let(delta1 = minus(curr, prev))
  let(delta2 = minus(next, curr))
  let(len1 = length(delta1))
  let(len2 = length(delta2))
  multiply(
    point(
      delta1.y / len1 + delta2.y / len2,
      -delta1.x / len1 - delta2.x / len2
    ), 1/2
  )
;

offset_path = function (points, offset)
  let(length = len(points))
  map(points, function(curr,i,l)
    let(next = points[(i + 1) % length])
    let(prev = points[(i - 1 + length) % length])
    let(n = get_normal_vector(prev, curr, next))
    plus(curr, point(n.x * offset, n.y * offset))
  )
;

get_segments_from_side_values = function (cornerRadius, circlePerimeter, hSide, vSide, cSide) [
  ["top", hSide, point(cornerRadius, 0), point( 1, 0)],
  ["top-right", cSide, point(cornerRadius+hSide, cornerRadius), 0],
  ["right", vSide, point(2*cornerRadius+hSide, cornerRadius), point( 0, 1)],
  ["bottom-right", cSide, point(cornerRadius+hSide, cornerRadius+vSide), 1],
  ["bottom", hSide, point(cornerRadius+hSide, 2*cornerRadius+vSide), point(-1, 0)],
  ["bottom-left", cSide, point(cornerRadius, cornerRadius+vSide), 2],
  ["left", vSide, point(0, cornerRadius+vSide), point( 0,-1)],
  ["top-left", cSide, point(cornerRadius, cornerRadius), 3],
];

get_segments = function (width, height, cornerRadius)
  get_segments_from_side_values(
    cornerRadius,
    perimeter_of_circle(cornerRadius),
    width - 2 * cornerRadius,
    height - 2 * cornerRadius,
    perimeter_of_circle(cornerRadius)/4
  )
;

get_distances = function (segments)
  partial_sums(map(segments, function (s,i,l) s[1]))
;

calculate_straight_side = function (segment, distanceFromSegmentStart, weaving)
  let(start = segment[2])
  let(delta = segment[3])
  plus(plus(start, multiply(delta, distanceFromSegmentStart)), multiply(swap(delta), weaving))
;

calculate_corner = function (segment, distanceFromSegmentStart, cornerRadius, circlePerimeter, weaving)
  let(start = segment[2])
  let(angle = (segment[3] + 4*distanceFromSegmentStart/circlePerimeter) * PI/2)
  plus(start, multiply(unit_circle_point_clockwise(angle), cornerRadius - weaving))
;

points_along_rounded_rect = function (
  width,
  height,
  cornerRadius,
  numberOfPoints,
  numberBetweenPoints,
  bulge
)
  let(circlePerimeter = perimeter_of_circle(cornerRadius))
  let(totalPerimeter = perimeter_of_rounded_rect(width, height, cornerRadius))
  let(segments = get_segments(width, height, cornerRadius))
  let(distances = get_distances(segments))
  let(numberOfPoints = numberOfPoints ? numberOfPoints : Math.round(totalPerimeter/3))
  let(number = numberOfPoints * numberBetweenPoints)
  let(distanceBetweenPoints = totalPerimeter / number)

  map(
    range(number),
    function (num, i, l)
      let(n = 2 * numberBetweenPoints)
      let(c = (i % n) / n * 2 * PI)
      let(weaving = bulge * cosr(c))
      let(distanceFromStart = i * distanceBetweenPoints)
      let(segmentIndex = find_index(distances, function (distance) distanceFromStart < distance))
      let(segment = segments[segmentIndex])
      let(distanceFromSegmentStart = segmentIndex == 0
        ? distanceFromStart
        : distanceFromStart - distances[segmentIndex-1]
      )
      segmentIndex%2 == 0
        ? calculate_straight_side(segment, distanceFromSegmentStart, segmentIndex%4 == 0 ? weaving : -weaving)
        : calculate_corner(segment, distanceFromSegmentStart, cornerRadius, circlePerimeter, weaving)
  )
;

module bulged_shape(basket_length, basket_width, corner_radius, num_of_rods, bulge, thickness, opposite = true) {
  bulge = (opposite ? 1 : -1) * bulge;

  point_list = map(
    points_along_rounded_rect(basket_width, basket_length, corner_radius, num_of_rods, 24, bulge),
    function (p, i, l) minus(p, point(basket_width / 2, basket_length / 2))
  );

  point_list_outside = offset_path(point_list, thickness/2);
  point_list_inside = offset_path(point_list, -thickness/2);
  
  difference() {
    polygon(point_list_outside);
    polygon(point_list_inside);
  }
}

module weaved_layers(num_of_rods, bulge, basket_length, basket_width, corner_radius, thickness, basket_height, num_of_layers = 0, epsilon = 0.1) {
  num_of_layers = num_of_layers == 0 ? round(basket_height / (2 * bulge)) : num_of_layers;
  layer_thickness = basket_height / num_of_layers;
  for (i=[0:num_of_layers - 1])
    translate([0, 0, i * layer_thickness])
    linear_extrude(layer_thickness + epsilon)
    bulged_shape(basket_length, basket_width, corner_radius, num_of_rods, bulge, thickness, i % 2 == 0);
}

module ring(
  length = 150,
  width = 100,
  corner_radius = 15,
  ring_radius = 5,
  z = 0
) {
  r = ring_radius;
  c = corner_radius - ring_radius;
  v = width/2 - c - r;
  h = length/2 - c - r;

  translate([0, 0, z])
  union() {
    translate([ v,  h, 0]) rotate([0, 0,   0]) rotate_extrude(angle=90, $fn = 240) translate([c, 0]) circle(r, $fn = 240);
    translate([-v,  h, 0]) rotate([0, 0,  90]) rotate_extrude(angle=90, $fn = 240) translate([c, 0]) circle(r, $fn = 240);
    translate([-v, -h, 0]) rotate([0, 0, 180]) rotate_extrude(angle=90, $fn = 240) translate([c, 0]) circle(r, $fn = 240);
    translate([ v, -h, 0]) rotate([0, 0, 270]) rotate_extrude(angle=90, $fn = 240) translate([c, 0]) circle(r, $fn = 240);

    translate([-(v+c), -h, 0]) rotate([90, 0, 180]) cylinder(r=r, h=2*h, $fn = 240);
    translate([ (v+c), -h, 0]) rotate([90, 0, 180]) cylinder(r=r, h=2*h, $fn = 240);
    translate([-v, -(h+c), 0]) rotate([90, 0,  90]) cylinder(r=r, h=2*v, $fn = 240);
    translate([-v,  (h+c), 0]) rotate([90, 0,  90]) cylinder(r=r, h=2*v, $fn = 240);
  }
}

module plate(
  length = 24,
  width = 16,
  radius = 2,
  height = 1,
  z = 0
) {
  v = width/2 - radius;
  h = length/2 - radius;

  translate([0, 0, -height/2 + z])
  hull($fn=120) {
    translate([ v, h, 0]) cylinder(h=height, r=radius);
    translate([-v, h, 0]) cylinder(h=height, r=radius);
    translate([-v,-h, 0]) cylinder(h=height, r=radius);
    translate([ v,-h, 0]) cylinder(h=height, r=radius);
  };
}

module rods(length = 24, width = 16, corner_radius = 2, number_of_rods = 12, rod_radius = 1, rod_height = 10, z = 0) {
  rod_points = map(
    points_along_rounded_rect(width, length, corner_radius, number_of_rods, 1, 0),
    function (p, i, l) minus(p, point(width / 2, length / 2))
  );
  for (rod_point = rod_points)
    translate([rod_point.x, rod_point.y, z])
    cylinder(r = rod_radius, h = rod_height, $fn = 240);
}

module rectangular_woven_basket(
  basket_length = 100,
  basket_width = 80,
  basket_height = 80,
  num_of_rods = 24,
  rod_radius = 1,
  corner_radius = 15,
  num_of_layers = 8,
  ring_radius = 0,
  thickness = 1,
  epsilon = 0.1
) {
  ring_radius = ring_radius == 0 ? 1.8 * rod_radius : ring_radius;
  base_length = basket_length + 2 * ring_radius;
  base_width = basket_width + 2 * ring_radius;
  base_radius = corner_radius;

  ring(base_length, base_width, base_radius, ring_radius, basket_height);
  weaved_layers(num_of_rods, rod_radius, basket_length, basket_width, corner_radius, thickness, basket_height, num_of_layers);
  rods(basket_length, basket_width, corner_radius, num_of_rods, rod_radius, basket_height);
  ring(base_length, base_width, base_radius, ring_radius, 0);
  plate(base_length, base_width, base_radius, ring_radius, -ring_radius/2);
}

module put(x = 0, y = 0, z = 0, c = "gray") {
  color(c)
  translate([x, y, z]) 
  children();
}

color("#ffd090") rectangular_woven_basket(basket_length, basket_width, basket_height, num_of_rods, rod_radius, corner_radius, num_of_layers, ring_radius, thickness, epsilon);
