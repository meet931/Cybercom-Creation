<template>
    <div>
        <!-- instead of v-model="$store.state.colorCode", we will use computed property -->
        <input type="text" placeholder="Enter color code" v-model="colorCode">
    </div>
</template>

<script>
export default {
    computed: {
        colorCode: {
            get() {
                // get the value of colorCode from state object
                return this.$store.state.colorCode;
            },
            set(newValue) {
                // grab the newValue from input and store it into 'setColorCode' mutation
                // this.$store.commit('setColorCode', newValue)   // commit -> for mutaltion
                this.$store.dispatch('setColorCode', newValue)    // dispatch -> actions
                // console.log(newValue)
            }
        }
    }
}
</script>

<style></style>