// 导入 Vue 模块
import Vue from 'vue'

// 导入根组件 App.vue
import App from './App.vue'

// 导入vue-router插件
// 导入前先使用npm i vue-router@3安装
// vue2安装vue-router@3的版本，4以上的版本只支持vue3
import VueRouter from 'vue-router'

// 导入路由实例对象
import router from './router'

import store from './store'; // 引入 Vuex store


// 使用路由插件
Vue.use(VueRouter)

// 配置生产环境提示，阻止 Vue 在启动时生成生产提示
Vue.config.productionTip = false

// 创建一个新的 Vue 实例
new Vue({
  // 渲染根组件 App.vue
  // render 配置选项，用于指定 Vue 实例的根组件的渲染函数
  render: h => h(App),
  router,
  store
}).$mount('#app') // 将根组件挂载到 id 为 app 的 DOM 元素上

// h 函数通常是 createElement 函数的别名，用于创建虚拟 DOM（Virtual DOM）节点。这个函数的名字来自于 "hyperscript"，是 React 中类似的函数的命名风格。
//createElement 函数接受三个参数：
// tag（String | Object | Function）：指定要创建的元素的标签名、组件选项对象，或者一个函数。如果是标签名，则创建一个 HTML 元素；如果是组件选项对象，则创建一个 Vue 组件实例；如果是函数，则会调用该函数并返回其结果。
// data（Object）：（可选）包含了一些特性和事件监听器等的数据对象，用于配置要创建的元素或组件。
// children（Array | String）：（可选）表示要添加到元素中的子节点，可以是一个包含其他 VNode 的数组，也可以是一个字符串，表示文本内容。