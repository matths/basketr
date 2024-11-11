import { length, minus, point } from "./path-utils";

export const normalVector = (prev, curr, next) => {
  const delta1 = minus(curr, prev);
  const delta2 = minus(next, curr);
  const len1 = length(delta1);
  const len2 = length(delta2);
  return point(
    (delta1.y / len1 + delta2.y / len2) / 2,
    (-delta1.x / len1 - delta2.x / len2) / 2
  );
};
