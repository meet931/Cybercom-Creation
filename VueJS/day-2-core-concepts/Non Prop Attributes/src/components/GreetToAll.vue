<template>
    <h2>Hello {{ name }} and a.k.a {{ movie }}</h2>
</template>

<script>
export default {
    name: "GreetToAll",
    props: ['name', 'movie']
}
</script>