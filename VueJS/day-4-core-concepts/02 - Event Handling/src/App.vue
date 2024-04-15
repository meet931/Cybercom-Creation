<template>
  <h2>{{ name }}</h2>

  <button v-on:click="changeName($event), increase1($event)">Change name</button>

  <br><br><br>

  <div>
    <h2>Counter</h2>
    <p>{{ value }}</p>

    <!-- <button v-on:click="increase1">Increase 1</button>&nbsp; -->
    <button @click="increase1">Increase 1</button>&nbsp;
    <button @click="decrease1">Decrease 1</button>&nbsp;
    <button @click="increase5">Increase 5</button>&nbsp;
    <button @click="decrease5">Decrease 5</button>
  </div>
</template>

<script>

export default {
  name: 'App',
  components: {},
  data() {
    return {
      name: "Mitesh",
      value: 0
    }
  },

  methods: {
    changeName() {
      this.name = 'Mitesh Chaudhari'
    },
    increase1(event) {
      console.log(event.type);
      this.value++;
    },
    decrease1() {
      this.value--;
    },
    increase5() {
      this.value += 5;
    },
    decrease5() {
      this.value -= 5;
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
