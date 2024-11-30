
//引入Vue核心库
import Vue from 'vue'

// 引入Vuex
// pm安装 npm i vuex@3，vue2最高支持vuex3版本，vue3才支持高vuex4以上的版本
import Vuex from 'vuex'


//应用Vuex插件
Vue.use(Vuex)

//准备actions对象——响应组件中用户的动作
const actions = {
    incrementAsync({ commit }) {
        setTimeout(() => {
            commit('increment');
        }, 1000);
    }
}
//准备mutations对象——修改state中的数据
const mutations = {
    increment(state) {
        state.count++;
    }
}
//准备state对象——保存具体的数据
const state = {
    count: 0
}

const getters = {
    doubleCount(state) {
        return state.count * 2;
    }
}

//创建并暴露store
export default new Vuex.Store({
    actions,
    mutations,
    state,
    getters
})