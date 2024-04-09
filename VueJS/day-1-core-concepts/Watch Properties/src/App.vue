<template>
  <h1>Volume Tracker (0 - 20)</h1>
  <h3>Current Volume - {{ volume }}</h3>
  <div>
    <button @click="volume += 2">Increase</button>&nbsp;
    <button @click="volume -= 2">Decrease</button>
  </div>
  <input type="text" v-model="movie">
  <input type="text" v-model="movieInfo.title">
  <input type="text" v-model="movieInfo.actor">
  <div>
    <!-- <button @click="movieList.push('Wonder woman')">Add Movie</button> -->
    <button @click="movieList = movieList.concat(['Wonder woman'])">Add Movie</button>
  </div>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      volume: 0,
      movie: 'Batman',
      movieInfo: {
        title: '',
        actor: ''
      },
      movieList: ['Batman', 'Superman']
    }
  },
  methods: {},
  computed: {},
  watch: {
    volume(newValue, oldValue) {
      if(newValue > oldValue && newValue === 16) {
        alert('Listening to a high volume for a long time may damage your hearing')
      }
    },
    movie: {
      handler(newValue) {
        console.log(`Calling API with movie name = ${newValue}`);
      },
      immediate: true   // handler fun. should be run when when pageload.
      //often with API when fetching data, it should show data when page is loaded. 
    },
    movieInfo: {
      handler(newValue){
        console.log(`Calling API withk movie title = ${newValue.title} and actor = ${newValue.actor}`);
      },
      deep: true
    },
    movieList: {
      handler(newValue) {
        console.log(`Updated List ${newValue}`)
      },
      // deep: true
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Arial, Helvetica, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>