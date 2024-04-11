// Previously we were doing like this
// count app = Vue.createApp({
//     data() {
//         return {

//         }
//     }
// })
// app.mount('#app')

// -----------------------------------------------------------------

// Here: 
import { createApp } from 'vue'    // createApp is a function here
import App from './App.vue'        // App is root component

createApp(App).mount('#app')       // we want to mount content at #app
