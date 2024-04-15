<template>
    <div>
      <h2>Username from Component F -> {{ username }}</h2>
    </div>
</template>

<script>
export default {
    name: 'ComponentF',
    inject: ['username']
}
</script>

<style>

</style>
