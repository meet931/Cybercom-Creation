<template>
<div v-for="name in names" :key="name.firstName">
<!-- {{ name.firstName }} {{ name.lastName }} -->

<slot :firstName="name.firstName" :lastName="name.lastName"></slot>
</div>
</template>

<script>
export default {
  name: 'Namelist',
  data() {
    return {
      names: [
        { firstName: 'Mitesh', lastName: 'Chaudhari' },
        { firstName: 'Bhavisha', lastName: 'Chaudhari' },
        { firstName: 'Dipak', lastName: 'Chaudhari' }
      ]
    }
  }
}
</script>

<style></style>