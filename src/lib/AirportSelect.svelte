<script>
    export let airports = [];
    export let selectedAirport;

    function handleChange(event) {
        selectedAirport = event.target.value;
    }
</script>

<div>
    <label for="airport-select">Select Airport:</label>
    <select id="airport-select" on:change={handleChange}>
      {#each airports as airport}
        <option value={airport}>{airport}</option>
      {/each}
    </select>
  </div>