<template>
  <div>
    <!-- <h2>Child Style Component</h2> -->
    <slot></slot>
  </div>
</template>

<script>
export default {
  name: 'ChildStyle'
}
</script>

<!-- <style> -->
<style scoped>
h2 {
  color: olive;
}
</style>