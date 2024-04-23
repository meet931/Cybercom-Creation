<template>
     <!-- counter -->
    <div class="counter" :style="{ color: $store.state.colorCode }">
        {{ $store.state.counter }}
    </div>
</template>