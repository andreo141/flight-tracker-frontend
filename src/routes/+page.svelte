<script>
	import { onMount } from 'svelte';
	export let data;
	let flights = [];
	onMount(async () => {
		console.log('calling flight data API');
		const res = await fetch('http://localhost:8000/flights');
		data = await res.json();
		flights = data.data.everywhereDestination.results;
	});
</script>

<body>
	<header class="grid-header">
		<h1>Cheap flight tracker</h1>
		<h2>Wanna GTFO? Here are the flights leaving tomorrow!</h2>
	</header>

	<main class="grid-main">
		<section class="grid-section-flights">
			<h2>Flights</h2>
			<span><strong> Departure:</strong> {data.departureDate}</span> <br />
			<span><strong>Return:</strong> {data.returnDate}</span>
			<ul>
				{#each flights as flight}
					<div class="destination-wrapper">
						{#if flight.content.flightQuotes.cheapest.direct}
							<span>Directe vlucht</span>
						{:else}
							<span>Overstap vlucht</span>
						{/if}
						<li class="destination">
							{flight.content.flightQuotes.cheapest.price}
							{flight.content.location.name}
						</li>
						<img src={flight.content.image.url} alt="" />
					</div>
				{/each}
			</ul>
		</section>
	</main>

	<footer class="grid-footer"></footer>
</body>

<style>
	main {
		display: grid;
	}

	.destination-wrapper {
		display: flex;
		flex-direction: column;
		margin-bottom: 2rem;
		list-style: none;
	}

	img {
		width: 200px;
		height: auto;
		border-radius: 8px;
	}
</style>
