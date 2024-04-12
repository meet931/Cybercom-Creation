<!-- 
  Challenge
      - create an extra button to open a different modal 
      - use the same modal component but pass in a different template (slot)
      - use a different method (e.g. toggleModalTwo) and data (e.g. showModalTwo)
 -->

 <template>
  <h1>{{ title }}</h1>

  <!-- Modal 1 -->
  <!-- teleport -> when we want to teleport(show) our content inside it. Here, we are showing it to #modals in /public/index.html -->
  <teleport to="#modals" v-if="showModal">
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
  </teleport>

  <!-- Modal 2 -->
  <teleport to="#modals" v-if="showModalTwo">
    <ModalComponent theme="sale" @close="toggleModalTwo">
      <template v-slot:login-inputs>
        <p>Email: <input type="email"></p>
        <p>Password: <input type="password"></p>
      </template>

      <h2>Login</h2>
    </ModalComponent>
  </teleport>

  <p>Welcome...</p>

  <!-- Here, we're specifying that when we click button with alt key then it will open the modal. -->
  <button @click.alt="toggleModal">Open Modal 1</button> &nbsp;
  <button @click.alt="toggleModalTwo">Open Modal 2</button>
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
      showModal: false,
      showModalTwo: false
    }
  },

  methods: {
    toggleModal() {
      this.showModal = !this.showModal;
    },

    toggleModalTwo() {
      this.showModalTwo = !this.showModalTwo;
    }
  }
}
</script>

<style>
#app, #modals {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
