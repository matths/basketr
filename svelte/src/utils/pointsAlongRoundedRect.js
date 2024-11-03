import { nums, TAU } from "./math-utils";
import { point, plus, multiply, swap, cwAngle2Point } from "./path-utils";

const perimeterOfCircle = (radius) => TAU * radius;
const perimeterOfRect = (width, height) => 2 * (width + height);  
const perimeterOfRoundedRect = (width, height, radius) =>
  perimeterOfCircle(radius) +
  perimeterOfRect(width, height) - 8 * radius
;

const getSegments = (width, height, cornerRadius) => {
  const circlePerimeter = perimeterOfCircle(cornerRadius);
  const hSide = width - 2 * cornerRadius;
  const vSide = height - 2 * cornerRadius;
  const cSide = circlePerimeter/4;
  const cr = cornerRadius;
  return [
    {id: "t_", length: hSide, start: point(  cr        ,            0), delta: point( 1, 0)},
    {id: "tr", length: cSide, start: point(  cr + hSide,   cr        ), a: 0},
    {id: "r_", length: vSide, start: point(2*cr + hSide,   cr        ), delta: point( 0, 1)},
    {id: "br", length: cSide, start: point(  cr + hSide,   cr + vSide), a: 1},
    {id: "b_", length: hSide, start: point(  cr + hSide, 2*cr + vSide), delta: point(-1, 0)},
    {id: "bl", length: cSide, start: point(  cr        ,   cr + vSide), a: 2},
    {id: "l_", length: vSide, start: point(           0,   cr + vSide), delta: point( 0,-1)},
    {id: "tl", length: cSide, start: point(  cr        ,   cr        ), a: 3},
  ];
};

const addUp = (prev, curr, i) => [...prev, curr + (i > 0 ? prev[i - 1] : 0)];

const getDistances = (segments) =>
  segments.map(s => s.length).reduce(addUp, [])
;

const calculateStraightSide = (segment, distanceFromSegmentStart, weaving) =>
  plus(
    plus(
      segment.start,
      multiply(segment.delta, distanceFromSegmentStart)
    ),
    multiply(swap(segment.delta), weaving)
  )
;

const calculateCorner = (segment, distanceFromSegmentStart, cornerRadius, circlePerimeter, weaving) => {
  const angle = (segment.a + 4*distanceFromSegmentStart/circlePerimeter) * TAU/4;
  return plus(
    segment.start,
    multiply(
      cwAngle2Point(angle),
      cornerRadius - weaving
    )
  );
};

export const pointsAlongRoundedRect = (
  width,
  height,
  cornerRadius,
  numberOfPoints,
  numberBetweenPoints = 0,
  bulge = 0
) => {
  if (!numberOfPoints) {
    numberOfPoints = Math.round(totalPerimeter/3);
  }

  const circlePerimeter = perimeterOfCircle(cornerRadius);
  const totalPerimeter = perimeterOfRoundedRect(width, height, cornerRadius);
  const segments = getSegments(width, height, cornerRadius);
  const distances = getDistances(segments);

  const number = numberOfPoints * (1 + numberBetweenPoints);
  const distanceBetweenPoints = totalPerimeter / number;

  return nums(number).map((i) => {
      const n = 2 * (1 + numberBetweenPoints);
      const c = (i % n) / n * TAU;
      const weaving = bulge * Math.cos(c).toFixed(2);

      const distanceFromStart = i * distanceBetweenPoints;
      const segmentIndex = distances.findIndex((distance) => distanceFromStart < distance);
      const segment = segments[segmentIndex];
      const distanceFromSegmentStart = segmentIndex === 0
        ? distanceFromStart
        : distanceFromStart - distances[segmentIndex-1]
      ;
      return segmentIndex%2 === 0
        ? calculateStraightSide(segment, distanceFromSegmentStart, segmentIndex%4 === 0 ? weaving : -weaving)
        : calculateCorner(segment, distanceFromSegmentStart, cornerRadius, circlePerimeter, weaving)
      ;
    })
  ;
};
