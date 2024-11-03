<script>
	import { offsetPath } from '../utils/offsetPath.js';
	import { pointsAlongRoundedRect as pointsAlong } from '../utils/pointsAlongRoundedRect.js';

	export let basketColor = '#ffd090';

	export let width = 400;
	export let height = 250;
	export let radius = 80;

	export let numberOfPoints = 14;
	export let numberBetweenPoints = 50;

	export let rodRadius = 8;
	export let bulge = 40;
	export let thickness = 40;
	export let dotRadius = 2;

	export let showRect = 1;
	export let showOpposite = 1;

	$: ptsA = pointsAlong(width, height, radius, numberOfPoints, numberBetweenPoints, bulge / 2);
	$: ptsB = pointsAlong(width, height, radius, numberOfPoints, numberBetweenPoints, -bulge / 2);
	$: ptsC = pointsAlong(width, height, radius, numberOfPoints);

	$: ptsAi = offsetPath(ptsA, thickness / 10);
	$: ptsAo = offsetPath(ptsA, -thickness / 10);
	$: ptsBi = offsetPath(ptsB, thickness / 10);
	$: ptsBo = offsetPath(ptsB, -thickness / 10);
</script>

<svg viewBox="-250 -250 500 500" style="background: #333;">
	<g transform="translate({-width / 2} {-height / 2})">
		{#each ptsAi as p, i}<circle cx={p.x} cy={p.y} r={dotRadius} fill={basketColor} />{/each}
		{#each ptsAo as p, i}<circle cx={p.x} cy={p.y} r={dotRadius} fill={basketColor} />{/each}
		{#if rodRadius > 0}
			{#each ptsC as p, i}<circle cx={p.x} cy={p.y} r={rodRadius} fill={basketColor} />{/each}
		{/if}
		{#if showOpposite}
			{#each ptsBi as p, i}<circle cx={p.x} cy={p.y} r={dotRadius} fill={basketColor} />{/each}
			{#each ptsBo as p, i}<circle cx={p.x} cy={p.y} r={dotRadius} fill={basketColor} />{/each}
		{/if}
	</g>

	{#if showRect}
		<rect
			x={-width / 2}
			y={-height / 2}
			{width}
			{height}
			rx={radius}
			ry={radius}
			stroke-width="1"
			stroke="#fff"
			fill="none"
		/>
	{/if}
</svg>
