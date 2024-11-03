export const getRandomInt = (min, max) => {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
};

export const nums = (len) => [...Array(len).keys()];

export const clamp = (v, min = 0, max = 1) => Math.min(max, Math.max(min, v));

export const lerp = (s, e, t) => (1 - t) * s + t * e;

export const invlerp = (s, e, v) => (v - s) / (e - s);

export const quad = (a) => a * a;

export const decimalPlaces = (n) => {
  const s = "" + (+n);
  const match = /(?:\.(\d+))?(?:[eE]([+\-]?\d+))?$/.exec(s);
  if (!match) { return 0; }
  return Math.max(
      0,
      (match[1] == '0' ? 0 : (match[1] || '').length)
      - (match[2] || 0));
};

export const TAU = 2 * Math.PI;
