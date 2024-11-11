import { TAU } from "./math-utils";
import { plus, point } from "./path-utils";
import { normalVector } from "./normalVector";

export const sineWavePath = (points, amplitude, frequency, start = TAU/4) => {
  const length = points.length;
  return points.map((curr, i) => {
    const next = points[(i + 1) % length];
    const prev = points[(i - 1 + length) % length];
    const n = normalVector(prev, curr, next);
    const sineOffset = amplitude * Math.sin((i / length) * frequency * TAU + start);
    return plus(curr, point(n.x * sineOffset, n.y * sineOffset));
  });
};
