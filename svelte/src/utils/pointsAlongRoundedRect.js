import { nums, TAU } from "./math-utils";
import { point, plus, multiply, cwAngle2Point } from "./path-utils";

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
  segments.map(s => s.length).reduce(addUp, []);

const calculateStraightSide = (segment, distanceFromSegmentStart) =>
  plus(segment.start, multiply(segment.delta, distanceFromSegmentStart));

const calculateCorner = (segment, distanceFromSegmentStart, cornerRadius, circlePerimeter) => {
  const angle = (segment.a + 4*distanceFromSegmentStart/circlePerimeter) * TAU/4;
  return plus(segment.start, multiply(cwAngle2Point(angle), cornerRadius));
};

const calculatePoint = (segment, segmentIndex, distanceFromSegmentStart, cornerRadius, circlePerimeter) => 
  segmentIndex%2 === 0
    ? calculateStraightSide(segment, distanceFromSegmentStart)
    : calculateCorner(segment, distanceFromSegmentStart, cornerRadius, circlePerimeter);

const getDistanceFromSegmentStart = (distances, distanceFromStart, segmentIndex) =>
  segmentIndex === 0
    ? distanceFromStart
    : distanceFromStart - distances[segmentIndex - 1];

const getSegmentData = (distances, distanceFromStart) => {
  const segmentIndex = distances.findIndex((distance) => distanceFromStart < distance);
  const distanceFromSegmentStart = getDistanceFromSegmentStart(distances, distanceFromStart, segmentIndex);
  return { segmentIndex, distanceFromSegmentStart };
};

export const pointsAlongRoundedRect = (
  width,
  height,
  cornerRadius,
  numberOfPoints
) => {
  const circlePerimeter = perimeterOfCircle(cornerRadius);
  const totalPerimeter = perimeterOfRoundedRect(width, height, cornerRadius);
  const segments = getSegments(width, height, cornerRadius);
  const distances = getDistances(segments);
  const distanceBetweenPoints = totalPerimeter / numberOfPoints;

  return nums(numberOfPoints).map((i) => {
    const distanceFromStart = i * distanceBetweenPoints;
    const { segmentIndex, distanceFromSegmentStart } = getSegmentData(distances, distanceFromStart);
    return calculatePoint(segments[segmentIndex], segmentIndex, distanceFromSegmentStart, cornerRadius, circlePerimeter);
  });
};

export const segmentAlongRoundedRect = (
  width,
  height,
  cornerRadius,
  numberOfPoints
) => {
  const totalPerimeter = perimeterOfRoundedRect(width, height, cornerRadius);
  const segments = getSegments(width, height, cornerRadius);
  const distances = getDistances(segments);
  const distanceBetweenPoints = totalPerimeter / numberOfPoints;

  return nums(numberOfPoints).map((i) => {
      const distanceFromStart = i * distanceBetweenPoints;
      return getSegmentData(distances, distanceFromStart).segmentIndex;
  });
};
