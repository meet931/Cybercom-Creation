<template>
  <div class="post-list">
    <div v-for="post in posts" :key="post.id">
        <SinglePost :post="post" />
    </div>
  </div>
</template>

<script>
import { onMounted, onUnmounted, onUpdated } from 'vue';
import SinglePost from '../components/SingelPost.vue'

export default {
    name: 'PostList',
    components: {
        SinglePost
    },
    props: ['posts'],
    setup(props) {
        // console.log(props.posts)

        // Lifecycle hooks in composition api
        onMounted(() => console.log('component mounted'))
        onUnmounted(() => console.log('component unmounted'))
        onUpdated(() => console.log('component updated.'))
    }
}
</script>

<style>

</style>