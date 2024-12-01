// 导出一个对象
module.exports = {
  // 配置了 Babel 的预设（preset），指定了使用 @vue/cli-plugin-babel 提供的预设。
  // 预设是一组 Babel 插件的集合，它们一起定义了一组特定的转译规则，以便将新版 JavaScript 语法转译成浏览器可兼容的旧版 JavaScript
  // 在这个配置中，@vue/cli-plugin-babel/preset 是 Vue CLI 提供的默认 Babel 预设，它内置了一些常用的 Babel 插件，用于转译 Vue 单文件组件、ES6+ 语法等，以便在不同的浏览器中正确运行 Vue 项目。
  // 使用 Vue CLI 创建的 Vue 项目通常会默认包含这个配置。
  presets: [
    '@vue/cli-plugin-babel/preset'
  ]

  // 其他选项...
}
