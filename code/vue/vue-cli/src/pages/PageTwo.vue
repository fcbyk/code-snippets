<template>
    <div>
        <p>Count: {{ $store.state.count }}</p>
        <p>Double Count: {{ $store.getters.doubleCount }}</p>
        <button @click="increment">Increment</button>
        <button @click="incrementAsync">Increment Async</button>
    </div>
</template>

<script>
export default { 
    name: 'PageTwo' ,
    methods: {
        increment() {
            this.$store.commit('increment');
        },
        incrementAsync() {
            this.$store.dispatch('incrementAsync');
        }
    }
}
</script>

<style></style>