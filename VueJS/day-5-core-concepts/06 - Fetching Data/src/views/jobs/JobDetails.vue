<template>
  <div v-if="job">
    <h1>{{ job.title }}</h1>
    <p>The Job id is {{ id }}</p>
    <p>{{ job.details }}</p>
  </div>
</template>

<script>
export default {
  props: ['id'],
  data() {
    return {
      job: null
    }
  },
  mounted() {
    fetch('http://localhost:3000/jobs/' + this.id)
      .then((response) => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then((data) => {
        console.log(data);
        this.job = data;
      })
      .catch((error) => {
        console.error('Error fetching data:', error);
      });
  }

  // data() {
  //     return {
  //         id: this.$route.params.id
  //     }
  // }
}
</script>

<style></style>