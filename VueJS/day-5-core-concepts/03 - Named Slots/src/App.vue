<template>
  <h2>Slots</h2>
  <!-- <Cards content="Card 1"/>
  <Cards content="Card 2"/> -->

  <!-- <Cards></Cards>
  <Cards>Card content</Cards>
  <Cards>
    <h2>Card Content</h2>
  </Cards> -->
  <!-- <Cards>
    <img src="https://picsum.photos/200" />
  </Cards> -->

  <Cards>
    <template v-slot:header>Header</template>
    <template v-slot:default>
      <img src="https://picsum.photos/200" />
    </template>
    <template v-slot:footer>
      <button>Select</button>
    </template>
  </Cards>
</template>

<script>
import Cards from './components/Cards.vue';

export default {
  name: 'App',
  components: {
    Cards
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
