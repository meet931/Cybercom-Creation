<template>
  <h2>Provide and Inject</h2>
  <p>App Component username: <strong><em>{{ name }}</em></strong></p>
  <ComponentC />
</template>

<script>
import ComponentC from './components/ComponentC.vue';

export default {
  name: 'App',
  components: {
    ComponentC
  },
  data() {
    return {
      name: 'Mitesh'
    }
  },
  provide() {
    return {
      username: this.name
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
  margin-top: 60px;
}
</style>
