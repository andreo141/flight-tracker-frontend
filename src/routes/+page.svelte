<script>
	import { onMount } from 'svelte';
	import { apiData, flights } from './store.js';

	onMount(async () => {
		console.log('calling flight data API');
		const result = fetch('http://localhost:8000/flights').then((response) =>
			response.json().then((jsonResponse) => {
				console.log(jsonResponse);
				apiData.set(jsonResponse);
			})
		);
		return result;
	});
</script>

<h1>flight tracker test</h1>

<main>
	<h2>Flights</h2>
	<ul>
		{#each $flights as flight}
			<li>{flight}</li>
		{/each}
	</ul>
</main>
