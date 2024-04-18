<template>
  <div class="home">
    <h1>Hello</h1>
    <p ref="p">My name is {{ name }} and my age is {{ age }}</p>
    <input type="text" v-model="name">&nbsp;
    <button @click="handleClick">Click Me</button>&nbsp;
    <button @click="age++">Add 1 to age</button>&nbsp;
    <button @click="age--">Minus 1 to age</button>
  </div>

  <br><br>

  <router-link :to="{ name: 'ref-vs-reactive' }">Go to Ref vs Reactive</router-link> <br><br>
  <router-link :to="{ name: 'search' }">Go to Search</router-link>
</template>

<script>
/*
In Vue.js, the Composition API is a new way of organizing and reusing code logic in Vue components. 
Instead of using Options API (where data, methods, computed properties, etc., are defined within a component), 
Composition API allows you to organize your component logic into reusable functions.

To use the Composition API in Vue.js, you first need to import the ref function from Vue's vue package.

Then, you can use the ref function to declare a reactive reference. Reactive references are like reactive 
variables that can hold a single value and trigger reactivity when their value changes.
*/

import { ref } from 'vue';

export default {
  name: 'Home',
  setup() {
    // console.log('setup');

    // console.log(this)  // this will be undefined here because 'this' keyword is not available in setup() function


    // we can use array, object, or a single value inside ref
    const p = ref(null)  // value of ref is null
    console.log(p, p.value)  // It will show Null for p.value because we have not registered p yet.

    // this is not reactive means if change the value of it then it will be not mutted to DOM
    // In Option API, data() method is reactive means if change the value of any property then it will be affected to DOM also
    // let name = 'Mitesh';
    // let age = 30;

    // when we use ref then it's value will be reactive
    const name = ref('Mitesh');
    const age = ref(30);

    const handleClick = () => {
      // console.log(p, p.value);
      // p.value.classList.add('active');
      // p.value.textContent = 'Hello, All !!'

      name.value = 'Mitesh Chaudhari';
      age.value = 23;
    }

    // whatever we are assigning in setup(), we have to register it into return 
    // return { name: name, age: age}
    return { name, age, handleClick, p };  // since it has same name and value
  }
}
</script>
