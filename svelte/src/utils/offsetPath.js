import { plus, point } from "./path-utils";
import { normalVector } from "./normalVector";

export const offsetPath = (points, offset) => {
  const length = points.length;
  return points.map((curr, i) => {
    const next = points[(i + 1) % length];
    const prev = points[(i - 1 + length) % length];
    const n = normalVector(prev, curr, next);
    return plus(curr, point(n.x * offset, n.y * offset));
  });
};
