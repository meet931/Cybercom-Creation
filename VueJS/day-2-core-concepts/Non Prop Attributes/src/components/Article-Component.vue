<template>
    <div>
        <h2>Article Component</h2>
        <h2 v-bind="$attrs">{{ title }}</h2>
        <h2>Likes - {{ likes }}</h2>
        <h2>Published - {{ isPublished ? 'Yes' : 'No' }}</h2>
    </div>
</template>

<script>
    export default {
        name: 'Article-Component',
        props: {
            title: {
                type: String,
                required: true,
                default: 'Default Title'
            },
            likes: Number,
            isPublished: Boolean
        },
        inheritAttrs: false  // prevents non-prop attributes from being applied to root element
    }
</script>

<style lang="scss" scoped>

</style>