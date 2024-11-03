<script>
  import Circle from './components/Circle.svelte';
  import RangeSlider from './components/RangeSlider.svelte';
  import RoundedRect from './components/RoundedRect.svelte';

  let rodRadius = 8;
  let bulge = 20;
  let thickness = 10;
  let lineWidth = 2;
  let showShape = 1;
  let showOpposite = 1;

  let radius = 200;
  let numOfRods = 12;
  let numberOfPoints = 200;

  let width = 400;
	let height = 250;
	let cornerRadius = 80;
	let numberOfPointsRect = 14;
	let numberBetweenPoints = 50;
</script>

<div class="general">
  <h1>Basketr</h1>

  <RangeSlider color="#cccccc" label="thickness" bind:value={thickness} min={0} max={20} />
  <RangeSlider color="#cccccc" label="bulge" bind:value={bulge} min={0} max={50} step={0.5}/>
  <RangeSlider color="#cccccc" label="line width" bind:value={lineWidth} min={0} max={10} />
  <br>
  <RangeSlider color="#cccccc" label="rod radius" bind:value={rodRadius} min={0} max={20} step={0.5} />
  <RangeSlider color="#cccccc" label="show shape" bind:value={showShape} min={0} max={1} />
  <RangeSlider color="#cccccc" label="show opposite" bind:value={showOpposite} min={0} max={1} />  

  <div class="component">
    <h2>circular</h2>
    <Circle
      basketColor="#5c69e4"
      strokeWidth={lineWidth}
      rodRadius={rodRadius}
      distanceSecond={thickness}
      bulge={bulge}
      showCircle={showShape}
      showOpposite={showOpposite}
      numOfRods={numOfRods}
      numberOfPoints={numberOfPoints}
      radius={radius}
    />
    <RangeSlider color="#5c69e4" label="radius" bind:value={radius} min={0} max={250} step={1} />
    <RangeSlider color="#5c69e4" label="rods count" bind:value={numOfRods} min={0} max={32} step={2} />
    <RangeSlider color="#5c69e4" label="segments" bind:value={numberOfPoints} min={0} max={200} />
  </div>
  
  <div class="component">
    <h2>rectangular</h2>
    <RoundedRect
      basketColor="#70b882"
      dotRadius={lineWidth/2}
      rodRadius={rodRadius}
      thickness={thickness*4}
      bulge={2*bulge}
      showRect={showShape}
      showOpposite={showOpposite}
      width={width}
      height={height}
      radius={cornerRadius}
      numberOfPoints={numberOfPointsRect}
      numberBetweenPoints={numberBetweenPoints}
    />
    <RangeSlider color="#70b882" label="width" bind:value={width} min={0} max={500} step={1} />
    <RangeSlider color="#70b882" label="height" bind:value={height} min={0} max={500} step={1} />
    <RangeSlider color="#70b882" label="corner radius" bind:value={cornerRadius} min={0} max={250} step={1} />
    <RangeSlider color="#70b882" label="rods count" bind:value={numberOfPointsRect} min={0} max={32} step={1} />
    <RangeSlider color="#70b882" label="points between rods" bind:value={numberBetweenPoints} min={0} max={200} />
  </div>
</div>

<style>
  .general {
    display: block;
    max-width: 800px;
    margin: 0 auto;
    text-align: center;
  }
  .component {
    display: inline-block;
    text-align: center;
    width: 48%;
    vertical-align: top;
  }

  h1, h2 {
    font-size: 24px;
    text-align: center;
  }

  h2 {
    font-size: 18px;
  }
</style>
