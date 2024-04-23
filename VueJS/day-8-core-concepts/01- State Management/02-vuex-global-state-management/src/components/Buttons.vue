<template>
    <!-- buttons -->
    <div class="buttons">
        <!-- commit -> mutation -->
        <!-- dispatch -> actions -->

        <!-- <button @click="$store.commit('decreaseCounter')">-</button>
      <button @click="$store.commit('increaseCounter')">+</button> -->

        <button @click="$store.dispatch('decreaseCounter')">-</button>
        <button @click="$store.dispatch('increaseCounter')">+</button>
    </div>
</template>

<script>
export default {

}
</script>

<style></style>