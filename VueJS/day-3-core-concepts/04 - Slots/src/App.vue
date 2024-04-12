 <template>
  <h1>{{ title }}</h1>

  <!-- Modal 1 -->
  <div v-if="showModal">
    <ModalComponent theme="sale" @close="toggleModal">
      <template v-slot:links>
        <a href="#">Sign Up</a>
        <a href="#">Login</a>
      </template>

      <!-- sometimes, we want to pass form input data to component at that time we can not pass form data as props. So, in that case slot can be very useful. -->
      <!-- This template content will pass from App(parent) to ModalComponent(child) -->
      <h2>We provide quality work</h2>
      <p>Choose the appropriate plan according to your need</p>
    </ModalComponent>
  </div>

  <p>Welcome...</p>

  <!-- Here, we're specifying that when we click button with alt key then it will open the modal. -->
  <button @click.alt="toggleModal">Open Modal 1</button>
</template>

<script>
import ModalComponent from './components/ModalComponent.vue';

export default {
  name: 'App',
  components: {
    ModalComponent
  },
  data() {
    return {
      title: 'Welcome to Our Website',
      showModal: false
    }
  },

  methods: {
    toggleModal() {
      this.showModal = !this.showModal;
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
</style>
