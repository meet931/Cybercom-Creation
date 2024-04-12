<template>
    <!-- @click -> if we click on backdrop or Modal, it will be closed. But, if...  -->
    <!-- @click.self -> it should only work(close modal) when we click to outside of Modal Class. That's backdrop itself only. -->
    <div class="backdrop" @click.self="closeModal">
        <div class="Modal" :class="{ sale: theme === 'sale' }">
            <slot></slot>    <!-- all form template content will show here. we are registering the content. -->
            <div class="action">
                <slot name="links">Default Text</slot>
            </div>

            <!-- <div class="action2">
                <slot name="login-inputs">Default Text</slot>
            </div> -->
        </div>
    </div>
</template>

<script>
export default {
    name: 'ModalComponent',
    props: ['theme'],
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

.Modal .action {
    text-align: center;
    margin: 30px 0 10px 0;
}

.Modal .action a {
    color: #333;
    padding: 8px;
    border: 1px solid #eee;
    border-radius: 4px;
    text-decoration: none;
    margin: 10px;
}

.Modal.sale {
    background: crimson;
    color: white;
}

.Modal.sale h1 {
    color: white;
}

.Modal.sale .action {
    color: white;
}

.Modal.sale .action a{
    color: white;
}

/* overwritting the style of p tag from global css */
.Modal p {
    font-style: normal;
}
</style>