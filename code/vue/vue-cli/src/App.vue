<!-- 一个文件就是一个组件 -->
<!-- Vue 的单文件组件（Single File Component，SFC）是一种将组件的模板、脚本和样式封装在一个文件中的方式。它的文件扩展名通常是 .vue -->

<!-- 组件的模板部分 -->
<template>
  <div id="app">
    <p><router-link to="/1">1</router-link></p>
    <p><router-link to="/2">2</router-link></p>
    <p><router-link to="/3">3</router-link></p>
    <router-view></router-view>
  </div>
</template>

<!-- 组件的脚本部分 -->
<!-- 组件的脚本部分通过 export default 导出一个配置对象，这样 Vue 才能正确地解析和使用组件 -->
<script>
export default {
  name: 'App'
}
</script>

<!-- 组件的样式部分，可以使用 CSS、SCSS、LESS 等预处理器编写样式。 -->
<!-- 通过 scoped 属性，可以将样式限定在当前组件的范围内，避免样式污染。 -->
<style>

</style>
