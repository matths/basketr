import { lerp } from './math-utils.js';

export const point = (x, y) => ({x, y});

export const point2array = (p) => [p.x, p.y];

export const minus = (a, b) => point(
	a.x - b.x,
	a.y - b.y
);

export const plus = (a, b) => point(
	a.x + b.x,
	a.y + b.y
);

export const multiply = (a, b) => point(
	a.x * b,
	a.y * b
);

export const swap = (p) => point(
	p.y,
	p.x
);

export const length = (v) =>
  Math.sqrt(v.x * v.x + v.y * v.y);

export const cwAngle2Point = (angle) => point(
  Math.sin(angle),
  -Math.cos(angle)
);

export const circlePoint = (center, radius, angle, distance = 1.0) => point(
  center.x + radius * Math.cos(-angle * Math.PI/180) * distance,
  center.y + radius * Math.sin(-angle * Math.PI/180) * distance
);

export const plerp = (s, e, t) => point(
  lerp(s.x, e.x, t),
  lerp(s.y, e.y, t),
);

export const plerpPoly = (pts, t) =>
	pts.map((p, i) => plerp(p, pts[(i === pts.length - 1 ? 0 : i + 1)], t));
