<script>
	import { onMount } from 'svelte';
	export let data;
	let flights = [];
	onMount(async () => {
		console.log('calling flight data API');
		const res = await fetch('https://flights-api.andreo.dev/flights');
		data = await res.json();
		flights = data.data.everywhereDestination.results;
	});
</script>

<body>
	<header class="grid-header">
		<h1>Cheap Flight Tracker</h1>
		<h2>Wanna GTFO? Here are the flights leaving tomorrow!</h2>
	</header>

	<main class="grid-main">
		<section class="grid-section-flights">
			<h2>Flights</h2>
			<div class="dates">
				<span><strong>Departure:</strong> {data.departureDate}</span>
				<span><strong>Return:</strong> {data.returnDate}</span>
			</div>
			<ul>
				{#each flights as flight}
					<li class="destination-wrapper">
						<div class="destination-info">
							{#if flight.content.flightQuotes.cheapest.direct}
								<span class="flight-type">Direct Flight</span>
							{:else}
								<span class="flight-type">Connecting Flight</span>
							{/if}
							<span class="price">{flight.content.flightQuotes.cheapest.price}</span>
							<span class="location">{flight.content.location.name}</span>
						</div>
						<img src={flight.content.image.url} alt={flight.content.location.name} />
					</li>
				{/each}
			</ul>
		</section>
	</main>

	<footer class="grid-footer">
		<p>&copy; 2024 Cheap Flight Tracker. All rights reserved.</p>
	</footer>
</body>

<style>
	body {
		font-family: 'Arial', sans-serif;
		background-color: #f0f2f5;
		color: #333;
		margin: 0;
		padding: 0;
	}

	header {
		background-color: #0073e6;
		color: white;
		padding: 1rem 2rem;
		text-align: center;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}

	header h1 {
		margin: 0;
		font-size: 2.5rem;
	}

	header h2 {
		margin: 0;
		font-size: 1.2rem;
		font-weight: normal;
	}

	main {
		display: grid;
		padding: 2rem;
	}

	.grid-section-flights {
		background-color: white;
		border-radius: 8px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		padding: 2rem;
	}

	.grid-section-flights h2 {
		margin-top: 0;
		font-size: 1.5rem;
	}

	.dates {
		margin-bottom: 1rem;
	}

	.dates span {
		display: block;
		margin-bottom: 0.5rem;
	}

	ul {
		padding: 0;
		list-style-type: none;
	}

	.destination-wrapper {
		display: flex;
		flex-direction: column;
		align-items: center;
		margin-bottom: 2rem;
	}

	.destination-info {
		background-color: #0073e6;
		color: white;
		border-radius: 8px;
		padding: 1rem;
		text-align: center;
		width: 100%;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		margin-bottom: 1rem;
	}

	.flight-type {
		display: block;
		font-weight: bold;
	}

	.price {
		font-size: 1.5rem;
		margin-top: 0.5rem;
	}

	.location {
		font-size: 1rem;
		margin-top: 0.5rem;
	}

	img {
		width: 70%;
		height: auto;
		border-radius: 8px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}

	footer {
		background-color: #0073e6;
		color: white;
		text-align: center;
		padding: 1rem;
		position: fixed;
		width: 100%;
		bottom: 0;
		box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.1);
	}
</style>
