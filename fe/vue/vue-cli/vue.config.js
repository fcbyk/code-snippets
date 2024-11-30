// 引入了 @vue/cli-service 中的 defineConfig 方法，用于定义 Vue CLI 项目的配置
const { defineConfig } = require('@vue/cli-service')

// 这里使用 module.exports 导出了一个对象，其中调用了 defineConfig 方法，并传入了一个对象作为参数。这个对象包含了 Vue CLI 项目的配置信息
module.exports = defineConfig({
  transpileDependencies: true
  // transpileDependencies: true：这个选项用于配置是否对依赖进行 Babel 转译。
  // 当设置为 true 时，Vue CLI 会对项目中的依赖进行 Babel 转译，以确保它们能在目标浏览器中正常运行。
  // 这在项目中使用了 ES6+ 语法的第三方库时非常有用，因为有些库可能并没有经过 Babel 转译。
})