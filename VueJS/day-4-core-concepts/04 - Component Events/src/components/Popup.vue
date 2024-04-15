<template>
    <div>
      <h2>This is Popup</h2>
      <button @click="$emit('close', 'Mitesh Chuadhari')">Close Popup</button>
    </div>
</template>

<script>
export default {
    name: 'Popup',
    emits: ['close']
}
</script>

<style>

</style>
