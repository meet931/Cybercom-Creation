<template>
  <div class="home">
    <h1>Home</h1>

    <div v-if="error">{{ error }}</div>
    <div v-if="posts.length">
      <PostList :posts="posts"/>
    </div>
    <div v-else>Loading...</div>
    
    <!-- <button @click="showPosts = !showPosts">toggle posts</button>
    <button @click="posts.pop()">Delelte Post</button> -->
  </div>

</template>

<script>
/* Topics to be covered:
- Props in setup
- Lifecycle hooks in setup
- Fetching data in setup
- Reusable composable functions
*/

import PostList from '../components/PostList.vue';
import getPosts from '../composables/getPosts'

export default {
  name: 'Home',
  components: {
    PostList
  },
  setup() {
    const { posts, error, load } = getPosts();

    load();

    return { posts, error }
  }

}
</script>

<style>

</style>