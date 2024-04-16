<template>

  <Namelist>
    <template v-slot:default="slotProps">
      {{ slotProps.firstName }} {{ slotProps.lastName }}
    </template>
  </Namelist>
  <br>
  <Namelist>
    <template v-slot:default="slotProps">
      {{ slotProps.lastName }} {{ slotProps.firstName }}
    </template>
  </Namelist>
  <br>
  <Namelist>
    <template v-slot:default="slotProps">
      {{ slotProps.firstName }}
    </template>
  </Namelist>
</template>

<script>
import Namelist from './components/Namelist.vue';

export default {
  name: 'App',
  components: {
    Namelist
  },
  data() {
    return {

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
