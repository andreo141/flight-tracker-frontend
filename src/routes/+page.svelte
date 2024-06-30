<h1>flight tracker test</h1>

<script>
import { onMount } from "svelte";
import { apiData, flights } from './store.js';

onMount (async () => {
    console.log('calling flight data API')
    const result = fetch('http://localhost:8000/flights')
    .then(
        response => response.json()
        .then(
            jsonResponse => {
                console.log(jsonResponse)
                apiData.set(jsonResponse)
            }
        )
    )
    return result
})
</script>

<main>
	<h1>Flights</h1>
	<ul>
	{#each $flights as flight}
		<li>{flight}</li>
	{/each}
	</ul>
</main>


