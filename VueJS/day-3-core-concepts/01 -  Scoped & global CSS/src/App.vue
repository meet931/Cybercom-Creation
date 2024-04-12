<template>
  <h1>{{ title }}</h1>
  <ModalComponent :header="header" :text="text" theme="sale"/>
</template>

<script>
import ModalComponent from './components/ModalComponent.vue';

export default {
  name: 'App',
  components: {
    ModalComponent
  },
  data(){
    return {
      title: 'Welcome to Our Website',
      header: 'We provide quality work',
      text: 'Choose the appropriate plan according to your need'
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
