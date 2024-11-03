<script>
import { clamp, decimalPlaces, invlerp, lerp } from "../utils/math-utils";

export let width = 160;
export let height = 25;
export let display = 'inline-block';
export let color = '#ffd090';
export let background = '#333';
export let border = '1px solid ' + color;
export let label = '';
export let value = 0;
export let min = 0;
export let max = 10;
export let step = 1;
export let disable = false;

let div;
let dragging = false;
$: decimals = decimalPlaces(step);
$: innerWidth = lerp(0, width, invlerp(min, max, value));

const update = (x) => {
  const currentWidth = clamp(x - div.getBoundingClientRect().left, 0, width);
  const fraction = invlerp(0, width, currentWidth);
  const rawValue = lerp(min, max, fraction);
  const stepValue = Math.round(rawValue / step) * step;
  const newValue = parseFloat(stepValue.toFixed(decimals));
  value = isNaN(newValue) ? 0 : newValue;
};

const addEventListeners = (document) => {
  document.addEventListener("pointermove", moveHandler);
  document.addEventListener("pointerup", upHandler);
};

const removeEventListeners = (document) => {
  document.removeEventListener("pointermove", moveHandler);
  document.removeEventListener("pointerup", upHandler);
};

const upHandler = (e) => {
  update(e.clientX);
  removeEventListeners(document);
  dragging = false;
};

const moveHandler = (e) => {
  update(e.clientX);
};

const downHandler = (e) => {
  if (!disable) {
    addEventListeners(document);
    update(e.clientX);
    dragging = true;
  }
};
</script>

<style>
  div {
		touch-action: none;
    cursor: pointer;
    position: relative;
    margin: 2px;
    text-align: left;
  }
  div:active:focus,
  div:active:hover {
    cursor: move;
  }
  div span:before {
    content: "";
    display: inline-block;
    height: 100%;
    vertical-align: middle;
  }
  div span {
    display: inline-block;
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    overflow: hidden;
    line-height: 100%;
    font-size: 10px;
    font-weight: bold;
    text-indent: 10px;
    vertical-align: middle;
    white-space: nowrap;
    user-select: none;
  }
</style>

<div bind:this={div} on:pointerdown={downHandler} style="border: {border}; display: {display}; background: {background}; width: {width}px; height: {height}px;">
  <span style="color: {color};">{label}{label?": ":""}{value.toFixed(decimals)}</span>
  <span style="color: {background}; background: {color}; width: {innerWidth}px;">{label}{label?": ":""}{value.toFixed(decimals)}</span>
</div>
