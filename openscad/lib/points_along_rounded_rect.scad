// points_along_rounded_rect.scad

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

include <list_fp.scad>;
include <partial_sums.scad>;
include <point.scad>;
include <circle.scad>;
include <perimeters.scad>;

get_segments_from_side_values = function (cornerRadius, hSide, vSide, cSide) [
  ["t_", hSide, point(  cornerRadius        ,                      0), point( 1, 0)],
  ["tr", cSide, point(  cornerRadius + hSide,   cornerRadius        ), 0],
  ["r_", vSide, point(2*cornerRadius + hSide,   cornerRadius        ), point( 0, 1)],
  ["br", cSide, point(  cornerRadius + hSide,   cornerRadius + vSide), 1],
  ["b_", hSide, point(  cornerRadius + hSide, 2*cornerRadius + vSide), point(-1, 0)],
  ["bl", cSide, point(  cornerRadius        ,   cornerRadius + vSide), 2],
  ["l_", vSide, point(                     0,   cornerRadius + vSide), point( 0,-1)],
  ["tl", cSide, point(  cornerRadius        ,   cornerRadius        ), 3],
];

get_segments = function (width, height, cornerRadius)
  get_segments_from_side_values(
    cornerRadius,
    width - 2 * cornerRadius,
    height - 2 * cornerRadius,
    perimeter_of_circle(cornerRadius)/4
  )
;

get_distances = function (segments)
  partial_sums(map(segments, function (s,i,l) s[1]))
;

calculate_straight_side = function (segment, distanceFromSegmentStart)
  let(start = segment[2])
  let(delta = segment[3])
  plus(start, multiply(delta, distanceFromSegmentStart))
;

calculate_corner = function (segment, distanceFromSegmentStart, cornerRadius, circlePerimeter)
  let(start = segment[2])
  let(angle = (segment[3] + 4*distanceFromSegmentStart/circlePerimeter) * PI/2)
  plus(start, multiply(unit_circle_point_clockwise(angle), cornerRadius))
;

points_along_rounded_rect = function (
  width,
  height,
  cornerRadius,
  numberOfPoints
)
  let(circlePerimeter = perimeter_of_circle(cornerRadius))
  let(totalPerimeter = perimeter_of_rounded_rect(width, height, cornerRadius))
  let(segments = get_segments(width, height, cornerRadius))
  let(distances = get_distances(segments))
  let(distanceBetweenPoints = totalPerimeter / numberOfPoints)

  map(
    range(numberOfPoints),
    function (num, i, l)
      let(distanceFromStart = i * distanceBetweenPoints)
      let(segmentIndex = find_index(distances, function (distance) distanceFromStart < distance))
      let(segment = segments[segmentIndex])
      let(distanceFromSegmentStart = segmentIndex == 0
        ? distanceFromStart
        : distanceFromStart - distances[segmentIndex-1]
      )
      segmentIndex%2 == 0
        ? calculate_straight_side(segment, distanceFromSegmentStart)
        : calculate_corner(segment, distanceFromSegmentStart, cornerRadius, circlePerimeter)
  )
;
