import { nums, TAU } from "./math-utils";
import { point } from "./path-utils";

const computeCirclePoint = (radius, angle) => point(
  radius * Math.cos(angle),
  radius * Math.sin(angle)
);

const computeBulgedCirclePoint = (radius, angle, bulge, numOfRods) => point(
  (radius - bulge * Math.cos(angle * numOfRods / 2)) * Math.cos(angle),
  (radius - bulge * Math.cos(angle * numOfRods / 2)) * Math.sin(angle)
);

export const pointsAlongCircle = (radius, numberOfPoints, bulge, numOfRods) =>
  nums(numberOfPoints).map(
    i => computeBulgedCirclePoint(radius, i / numberOfPoints * TAU, bulge, numOfRods)
  );
