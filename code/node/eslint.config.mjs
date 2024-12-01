export default {

  env: {
    // 环境配置
    // 用于指定你的代码将要运行的环境。
    // 这些环境可以是浏览器、Node.js、CommonJS、ES6 等
    // 通过设置 "env"，你可以告诉 ESLint 哪些全局变量是预定义的，以及哪些 JavaScript 语言特性是可用的。
    node: true,
  },

  extends: [
    // 指定继承自哪些预定义的规则集或自定义的配置文件
    // 可以通过 "extends" 来继承一些流行的规则集，比如 Airbnb、Google 或者 Standard 等，这样你就可以直接使用这些规则集中定义的规则，无需逐个配置
    // 另外，你也可以创建自己的共享配置文件，并通过 "extends" 来在不同的项目中共享和复用这些配置
  ],

  parserOptions: {
    // 配置 ESLint 解析器的选项，主要用于指定你的代码中使用了哪种 JavaScript 语法和功能
  },

  plugins: [
    // 配置 ESLint 使用的插件。插件是用来扩展 ESLint 功能的工具，它们通常包含了新的规则、规则集以及其他功能
    // 如果你正在使用 React 框架，你可以使用名为 "eslint-plugin-react" 的插件来启用与 React 相关的规则，以确保你的 React 代码符合最佳实践和规范
  ],

  globals: {
    // 声明全局变量及其可写性。这些声明告诉 ESLint 哪些全局变量是可以在代码中使用的，并且是否允许对它们进行赋值
    // 声明全局变量只是告诉 ESLint 这个变量是存在的，并且指定其可写性，但它并不会为你创建这个变量或提供代码提示
    myGlobalVar: "readonly",
    anotherGlobalVar: "writable"
  },

  rules: {
    // 配置具体的规则和规则的错误级别。你可以在这里启用、禁用、覆盖预定义的规则，或者自定义新的规则
    // 在这里添加你的自定义规则

    // 要求或禁止使用分号
    "semi":  2,

    // 禁止使用 console 对象
    "no-console": 2

  }
}