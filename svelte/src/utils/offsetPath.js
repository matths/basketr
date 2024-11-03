import { length, minus, plus, point } from "./path-utils";

const getNormalVector = (prev, curr, next) => {
  const delta1 = minus(curr, prev);
  const delta2 = minus(next, curr);
  const len1 = length(delta1);
  const len2 = length(delta2);
  return point(
    (delta1.y / len1 + delta2.y / len2) / 2,
    (-delta1.x / len1 - delta2.x / len2) / 2
  );
};

export const offsetPath = (points, offset) => {
  const length = points.length;
  return points.map((curr, i) => {
    const next = points[(i + 1) % length];
    const prev = points[(i - 1 + length) % length];
    const n = getNormalVector(prev, curr, next);
    return plus(curr, point(n.x * offset, n.y * offset));
  });
};
