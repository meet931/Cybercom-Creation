<template>
    <!-- counter square -->
    <div class="counter-square">
      {{ $store.state.counter }} <sup>2</sup> = {{ $store.getters.counterSquared }}
    </div>
</template>

<script>
export default {

}
</script>

<style>

</style>