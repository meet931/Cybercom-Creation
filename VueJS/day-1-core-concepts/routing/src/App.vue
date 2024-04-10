<template>
  <nav>
    <router-link to="/">Home</router-link> |
    <!-- <router-link to="/about">About</router-link> -->
    <router-link :to="{ name: 'about' }">About</router-link> |
    <router-link :to="{ name: 'jobs' }">Jobs</router-link>  
    <!-- more optimized way to routing become it might possible we change path from 'about' -> 'about-us'. 
         so we have to change path to from all the places. So, if we use object binding through data attribute, 
         we don't need to change anything. -->
  </nav>

  <button @click="redirect">Redirect</button>
  <button @click="back">Go Back</button>
  <button @click="forward">Forward</button>
  <router-view/>   <!-- whatever component we visit. It'll render here. -->
</template>

<script>
export default {
  methods: {
    redirect() {
      this.$router.push({ name: 'home'});
    },
    back() {
      this.$router.go(-1);
    },
    forward() {
      this.$router.go(1);
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

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
  padding: 10px;
  border-radius: 4px;
  text-decoration: none;
}

nav a.router-link-exact-active {
  color: #000a06;
  background-color: #42b983;
}

button {
  margin: 0 10px;
  padding: 10px;
  border: none;
  border-radius: 4px;
}
</style>
