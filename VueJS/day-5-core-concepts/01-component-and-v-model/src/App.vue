<template>
  <Input v-model="name" />
  <!-- <input type="text" v-model="name"> -->
  {{ name }}
</template>

<script>
import Input from './components/Input.vue';

export default {
  name: 'App',
  components: {
    Input
  },
  data() {
    return {
      name: ''
    }
  },
  methods: {}
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
