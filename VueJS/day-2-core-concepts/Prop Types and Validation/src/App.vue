<template>
  <!-- Here, likes has integer value. Hence we have to bind it otherwise it will take it as String. Same for boolean... -->
  <Article-Component title="Welcome to Our Article" :likes="50000" :isPublished="true"/>
</template>

<script>
import ArticleComponent from './components/Article-Component.vue';

export default {
  name: 'App',
  components: { 
    ArticleComponent
  },
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