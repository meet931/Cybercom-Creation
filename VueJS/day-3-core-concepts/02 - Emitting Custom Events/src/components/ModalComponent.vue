<template>
    <div class="backdrop" @click="closeModal">
        <div class="Modal" :class="{ sale: theme === 'sale' }">
            <h1>{{ header }}</h1>
            <p>{{ text }}</p>
        </div>
    </div>
</template>

<script>
export default {
    name: 'ModalComponent',
    props: ['header', 'text', 'theme'],
    methods: {
        closeModal() {
            this.$emit('close');
        }
    }
}
</script>

<!-- <style scoped> -->   <!-- it will have scope to this component only -->
<style>
.Modal {
  width: 400px;
  padding: 20px;
  margin: 100px auto;
  background: white;
  border-radius: 10px;
}
.backdrop {
  top: 0px;
  position: fixed;
  background: rgba(0, 0, 0, 0.5);
  width: 100%;
  height: 100%;
}
.Modal h1 {
  color:rgb(85, 213, 171);
  border: none;
  padding: 0px;
}

.Modal.sale {
    background: crimson;
    color: white;
}

.Modal.sale h1 {
    color: white;
}

/* overwritting the style of p tag from global css */
.Modal p {
    font-style: normal;
}
</style>