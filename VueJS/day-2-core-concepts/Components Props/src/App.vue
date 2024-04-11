<template>
  <GreetToAll name="SRK" movie="DDLJ"/>       <!-- components with props -->
  <GreetToAll name="Akshay" movie="Phir Hera Pheri"/>
  <GreetToAll name="Amir Khan" movie="3 Idiots"/>
  <GreetToAll :name="name" :movie="channel"/>
</template>

<script>
import GreetToAll from './components/Greet.vue';

export default {
  name: 'App',
  components: { GreetToAll },
  data() {
    return {
      name: 'Mitesh Chaudhari',
      channel: 'Grow With Meet'
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
  margin-top: 5rem;
}
</style>