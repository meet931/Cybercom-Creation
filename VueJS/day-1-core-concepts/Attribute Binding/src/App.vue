<template>
  <div>
    <h1>Attribute Binding</h1>
    <div v-if="showBooks">
      <ul>
        <li v-for="book in books" :key="book.isFav" :class="{ fav: book.isFav}">   <!-- Dynamic Classes -> { key: value } -->
          <!-- <img :src="book.img" v-bind:alt="book.title"> -->
          <img :src="book.img" :alt="book.title">
          <h3>{{ book.title }}</h3>
          <p>{{ book.author }}</p>
        </li>
      </ul>
    </div>

    <button @click="toggleShowBooks">
      <span v-if="showBooks">Hide Books</span>
      <span v-else>Show Books</span>
    </button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      showBooks: true,
      books: [
        { title: 'name of the wind', author: 'patrick rothfuss', img: 'assets/1.jpg', isFav: true },
        { title: 'the way of kings', author: 'brandon sanderson', img: 'assets/2.jpg', isFav: false },
        { title: 'the final empire', author: 'brandon sanderson', img: 'assets/3.jpg', isFav: true }
      ]
    }
  },

  methods: {
    toggleShowBooks() {
      this.showBooks = !this.showBooks;
    }
  }
}
</script>

<style>
body {
  background: #eee;
  max-width: 960px;
  margin: 20px auto;
}

p,
h3,
ul {
  margin: 0;
  padding: 0;
}

li {
  list-style-type: none;
  background: #fff;
  margin: 20px auto;
  padding: 10px 20px;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

li.fav {
            background: #ff9ed2;
            color: white;
        }

h1 {
  text-align: center;
}
</style>