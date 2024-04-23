import { createStore } from 'vuex'
import axios from 'axios';

export default createStore({
  // It's good to have a same set of mutations and actions

  state: {
    counter: 0,
    colorCode: 'red'
  },

  mutations: {
    decreaseCounter(state, randomNumber) {
      state.counter -= randomNumber;
      console.log('random nubmer: ',randomNumber);
    },

    increaseCounter(state, randomNumber) {
      // state.counter++;
      console.log('random nubmer: ',randomNumber);

      state.counter += randomNumber;
    },
    
    setColorCode(state, newValue) {
      // we have grab the newValue, now assign it colorCode within state
      state.colorCode = newValue;
    }
  },

  actions: {
    decreaseCounter({ commit }) {
      // console.log('increaseCounter (action)');
      axios('https://www.random.org/integers/?num=1&min=1&max=6&col=1&base=10&format=plain&rnd=new').then(response => {
        // to passs number from actions to mutation, we have to commit and then it will deduct random number to current nubmer
        // console.log('response: ', response.data)
        commit('decreaseCounter', response.data);
      })
    },

    increaseCounter({ commit }) {
      // console.log('increaseCounter (action)');
      axios('https://www.random.org/integers/?num=1&min=1&max=6&col=1&base=10&format=plain&rnd=new').then(response => {
        // to passs number from actions to mutation, we have to commit and then it will add random number to current nubmer
        // console.log('response: ', response.data)
        commit('increaseCounter', response.data);
      })
    },

    setColorCode({ commit }, newValue) {
      commit('setColorCode', newValue);
    }
  },

  getters: {
    counterSquared(state) {
      return state.counter * state.counter;
    }
  },

  modules: {
  }
})
