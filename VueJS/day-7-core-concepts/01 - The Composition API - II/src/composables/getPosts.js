import { ref } from 'vue';

const getPosts = () => {
    const posts = ref([])   // once data is loaded, we will populate data in this array
    const error = ref(null)  // if error accures then we will populate error here

    // const showPosts = ref(true)

    const load = async () => {
      try {
        let data = await fetch('http://localhost:3000/posts');
        if(!data.ok) {
          throw Error('No data available');
        }
        posts.value = await data.json();
      }
      catch (err) {
        error.value = err.message;
        console.log(error.value)
      }

    }
    
    return { posts, error, load }
}

export default getPosts;