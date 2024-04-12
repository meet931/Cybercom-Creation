<template>
  <h1>{{ title }}</h1>
  <div v-if="showModal">
    <ModalComponent :header="header" :text="text" theme="sale" @close="toggleModal"/>
  </div>

  <p>Welcome...</p>

  <button @click="toggleModal">Open Modal</button>
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
      text: 'Choose the appropriate plan according to your need',
      showModal: false
    }
  },

  methods : {
    toggleModal() {
      this.showModal = !this.showModal;
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
