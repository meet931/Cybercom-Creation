<template>
    <div>
        <h2>Article Component</h2>
        <h2>{{ title }}</h2>
        <h2>Likes - {{ likes }}</h2>
        <h2>Published - {{ isPublished ? 'Yes' : 'No' }}</h2>
    </div>
</template>

<script>
    export default {
        name: 'Article-Component',
        props: {      // here, Props will act as { key: value }
            title: {
                type: String,
                required: true,
                default: 'Default Title'   // if title is not there there then it will show this default one.
            },
            likes: Number,
            isPublished: Boolean
        }
    }
</script>

<style lang="scss" scoped>

</style>