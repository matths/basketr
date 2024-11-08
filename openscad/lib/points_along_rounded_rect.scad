// points_along_rounded_rect.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <list_fp.scad>;
include <partial_sums.scad>;
include <point.scad>;
include <circle.scad>;
include <perimeters.scad>;

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
