//引入VueRouter
import VueRouter from 'vue-router'
import PageOne from "../pages/PageOne"
import PageTwo from "../pages/PageTwo"
import PageThree from "../pages/PageThree"

// 需要默认导出一个 router 实例，参数为一个配置对象
export default new VueRouter({

	routes: [
		{
			path: '/1',
			component: PageOne
		},
		{
			path: '/2',
			component: PageTwo
		},
		{
			path: '/3',
			component: PageThree
		}
	]

})