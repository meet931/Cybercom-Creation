<template>
  <h2>Search</h2>
  <br>
  <input type="text" v-model="search">
  <p>Search terms - {{ search }}</p> <br>
  <!-- <p v-for="name in names" :key="name">{{ name }}</p> -->
  <p v-for="name in matchingNames" :key="name">{{ name }}</p>

  <button @click="handleClick">Stop Watching</button>
  <br><br>

  <router-link :to="{ name: 'home' }">Go to Home</router-link><br><br>
  <router-link :to="{ name: 'ref-vs-reactive' }">Go to Ref vs Reactive</router-link> <br>
</template>

<script>
import { computed, ref, watch, watchEffect } from 'vue';

export default {
    name: 'Search',
    setup() {
        const search =  ref('');
        const names = ref(['Mitesh', 'Bhavisha', 'Dipak', 'Ekta', 'Neha']);

        // const matchingNames = computed() => {
        //     return names.value.filter((name) => name.includes(search));
        // }

        const matchingNames = computed(() => {
            return names.value.filter((name) => name.includes(search.value));
        })

        // watch(search, () => {
        //     console.log('watch function ran')
        // })

        // watchEffect(() => {
        //     console.log('watchEffect function ran', search.value)
        // })

        // To stop watching, we have to invoke stopWatch and stopWwatchEffect function.
        // for stopping watch
        const stopWatch = watch(search, () => {
            console.log('watch function ran')
        })

        // for stopping watchEffect
        const stopWatchEffect = watchEffect(() => {
            console.log('watchEffect function ran', search.value)
        })

        const handleClick = () => {
            stopWatch();
            stopWatchEffect();
        }

        return { names, search, matchingNames, watch, watchEffect, stopWatch, stopWatchEffect, handleClick }
    }
}
</script>

<style>

</style>