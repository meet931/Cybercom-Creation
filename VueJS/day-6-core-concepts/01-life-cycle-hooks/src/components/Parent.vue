<template>
    <h2>Parent Component</h2>
    
    <Child v-if="showToggle" />
    <button @click="toggleChild">Toggle Child Component</button>
    
  </template>
  
  <script>
  import Child from './Child.vue';
  
  export default {
      name: 'Parent',
      components: {
          Child
      },
  
      data() {
          return {
              showToggle: true
          }
      },
  
      // Life Cycle Hooks
      beforeCreate() {
          console.log('Parent beforeCreate()')
      },
      created() {
          console.log('Parent created()')
      },
      beforeMount() {
          console.log('Parent beforeMount()')
      },
      mounted() {
          console.log('Parent mounted()')
      },
      beforeUpdate() {
          console.log('Parent beforeUpdate()')
      },
      updated() {
          console.log('Parent updated()')
      },
      beforeUnmount() {
          console.log('Parent beforeUnmount()')
      },
      unmounted() {
          console.log('Parent unmounted()')
      },
  
      methods: {
          toggleChild() {
              this.showToggle = !this.showToggle;
          }
      }
  }
  </script>
  
  <style>
  
  </style>