<template>
  <h2>Jobs</h2>
  <div v-if="jobs.length">
    <div v-for="job in jobs" :key="job.id" class="job">
      <!-- <router-link :to="{ name: 'JobDetails', params: { id: job.id} }"> -->
      <router-link :to="{ name: 'JobDetails', params: { id: job.id } }">
        <h2>{{ job.title }}</h2>
      </router-link>
    </div>
  </div>
  <div v-else>
    <p>Loading Jobs...</p>
  </div>
</template>

<script>
export default {
    data() {
        return {
            jobs: []   // we'll get data from fetching data from json file and will store here
        }
    },
    mounted() {
      fetch('http://localhost:3000/jobs')
        .then((response) => response.json())
        .then((data) => this.jobs = data)
        .catch((error) => console.log(error.message))
    }
}
</script>

<style>
.job h2 {
  background: #f4f4f4;
  padding: 20px;
  border-radius: 10px;
  margin: 10px auto;
  max-width: 600px;
  cursor: pointer;
  color: #444;
}
.job h2:hover {
  background: #ddd;
}
.job a {
  text-decoration: none;
}
</style>