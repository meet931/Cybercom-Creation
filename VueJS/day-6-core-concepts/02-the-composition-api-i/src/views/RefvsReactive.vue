<template>
    <h2>Ref</h2>
    <p>{{ detail1.name }} - {{ detail1.age }}</p>
    <button @click="updateDetail1">Update Details</button>

    <br><br>

    <h2>Reactive</h2>
    <p>{{ detail2.name }}  -  {{ detail2.age }}</p>
    <button @click="updateDetail2">Update Details</button>

    <br><br>

    <router-link :to="{ name: 'home' }">Go to Home</router-link><br><br>
    <router-link :to="{ name: 'search' }">Go to Search</router-link>
</template>

<script>
// ref and reactive both are reactive just like data function 
// the diff. btw them is only, we can directly access the value of object w/o .value

import { reactive, ref, watch } from 'vue';

export default {
    name: 'RefvsReactive',
    setup() {
        const detail1 = ref({ name: 'Mitesh', age: 30 });  // here detail1 is ref object
        const detail2 = reactive({ name: 'Dipak', age: 33 });

        const updateDetail1 = () => {
            detail1.value.name = 'Mitesh Chaudhari';
            detail1.value.age = 23;
        }

        const updateDetail2 = () => {
            detail2.name = 'Dipak Chaudhari';
            detail2.age = 24;
        }

        return { detail1, updateDetail1, detail2, updateDetail2 };
    }
}
</script>

<style></style>