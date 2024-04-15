<template>
  <h2>Validating Emitted Events - Here, we are doing operation for Child component to validate data when we are sending from Child to Parent Component.</h2>

  <button @click="showPopup = true">Show Popup</button>
  <Popup v-show="showPopup" @close="closePopup"/>
  
</template>

<script>
import Popup from './components/Popup.vue';

export default {
  name: 'App',
  components: {
    Popup
  },
  data() {
    return {
      showPopup: false
    }
  },
  methods: {
    closePopup(name) {
      this.showPopup = false
      console.log(name);
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
