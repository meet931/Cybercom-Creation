<template>
  <GreetToAll />
</template>

<script>
import GreetToAll from './components/Greet.vue';

export default {
  name: 'App',
  components: { GreetToAll }  // registering the components
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 5rem;
}
</style>