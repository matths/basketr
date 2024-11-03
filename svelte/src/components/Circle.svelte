<script>
	import { nums } from '../utils/math-utils';
	import { circlePoint, point, point2array } from '../utils/path-utils';
	import { pointsAlongCircle } from '../utils/pointsAlongCircle';

	export let basketColor = '#ffd090';

	export let radius = 200;

	export let numOfRods = 12;
	export let numberOfPoints = 200;

	export let rodRadius = 8;
	export let bulge = 20;
	export let distanceSecond = 10;
	export let strokeWidth = 4;

	export let showCircle = 1;
	export let showOpposite = 1;

	$: pts1 = pointsAlongCircle(radius+distanceSecond/2, numberOfPoints, bulge, numOfRods).flat().map(point2array).join(' ');
	$: pts2 = pointsAlongCircle(radius+distanceSecond/2, numberOfPoints, -bulge, numOfRods).flat().map(point2array).join(' ');

	$: pts1s = pointsAlongCircle(radius-distanceSecond/2, numberOfPoints, bulge, numOfRods).flat().map(point2array).join(' ');
	$: pts2s = pointsAlongCircle(radius-distanceSecond/2, numberOfPoints, -bulge, numOfRods).flat().map(point2array).join(' ');

  $: rods = nums(numOfRods).map((i) => circlePoint(point(0, 0), radius, (i / numOfRods) * 360));
</script>

<svg viewBox="-250 -250 500 500" style="background: #333;">
	<polygon points={pts1} stroke-width="{strokeWidth}" stroke={basketColor} fill="none" />
  {#if distanceSecond > 0}
  	<polygon points={pts1s} stroke-width="{strokeWidth}" stroke={basketColor} fill="none" />
	{/if}

  {#if showOpposite}
  	<polygon points={pts2} stroke-width="{strokeWidth}" stroke={basketColor} fill="none" />
    {#if distanceSecond > 0}
      <polygon points={pts2s} stroke-width="{strokeWidth}" stroke={basketColor} fill="none" />
    {/if}
	{/if}

  {#if rodRadius > 0}
		{#each rods as rod}
			<circle cx={rod.x} cy={rod.y} r={rodRadius} stroke="none" fill={basketColor} />
		{/each}
	{/if}

  {#if showCircle}
  	<circle cx={0} cy={0} r={radius} stroke-width="1" stroke="#fff" fill="none" />
	{/if}
</svg>
