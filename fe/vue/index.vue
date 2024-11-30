<!-- #region A09 -->
<script setup>
  const vExample = {
    mounted: (el,binding) => console.log(binding)
  }
</script>

<template>
  <div v-example:foo.bar.hello="baz"></div>
</template>
<!-- #endregion A09 -->