<template>
  <h1>Local Component State</h1>
  <h2>{{ message }}</h2>
  <button @click="change">See Magic</button>
  
</template>

<script>
/*
In Vue.js, every component can have its own local state. This state is defined in the data option of the component 
and is accessible only within that component. It's suitable for managing simple UI-specific data.
*/
export default {
  data() {
    return {
      message: 'Good Morning !! Click below to see the magic...'
    }
  },
  methods: {
    change() {
      this.message = 'Congratulation !! You have learnt first topic of state management s'
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
