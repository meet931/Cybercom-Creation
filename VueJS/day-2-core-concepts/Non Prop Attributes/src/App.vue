<template>
  <!-- A non-prop attribute is an attribute that is passed to a component, but does not have a corresponding property defined in the props option. -->
  <Article-Component id="my-article" title="Welcome to Our Article" :likes="50000" :isPublished="true"/>
</template>

<script>
import ArticleComponent from './components/Article-Component.vue';
// import GreetToAll from './components/GreetToAll.vue';

export default {
  name: 'App',
  components: { 
    // GreetToAll,
    ArticleComponent
  },
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