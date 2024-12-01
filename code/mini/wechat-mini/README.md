## 微信小程序概述
<a href="https://developers.weixin.qq.com/miniprogram/dev/framework/" style="margin-right: 5px;">官方文档</a>
<a href="https://mp.weixin.qq.com/cgi-bin/loginpage" style="margin-right: 5px;">账号注册</a>
<a href="https://www.bilibili.com/video/BV1834y1676P/" style="margin-right: 5px;">视频学习参考</a>

小程序开发本质就是前端开发，微信小程序是运行在微信宿主环境中，而网页运行在浏览器宿主环境，小程序中可以调用微信环境提供的各种 API，例如：地理定位、扫码、支付。

开发微信小程序需要，注册小程序开发帐号，获取小程序的 AppID，安装开发者工具

## 小程序项目结构

```txt
- pages 用来存放所有小程序的页面
- utils 用来存放工具性质的模块（例如：格式化时间的自定义模块）
- .eslintrc.js ESLint配置文件
- app.js 小程序项目的入口文件
- app.json 小程序项目的全局配置文件
- app.wxss 小程序项目的全局样式文件
- project.config.json 项目的配置文件
- project.private.config.json 项目私有配置文件
- sitemap.json 用来配置小程序及其页面是否允许被微信索引
```

## 小程序页面

小程序官方建议把所有小程序的页面，都存放在 pages 目录中，以单独的文件夹存在

其中，每个页面由 4 个基本文件组成，它们分别是：

- js文件（页面的脚本文件，存放页面的数据、事件处理函数等）
- json文件（当前页面的配置文件，配置窗口的外观、表现等）
- wxml 文件（页面的模板结构文件）
- wxss 文件（当前页面的样式表文件）

在app.json中新增和管理这些页面

## WXML模板

WXML（WeiXin Markup Language）是小程序框架设计的一套标签语言，用来构建小程序页面的结构，其作用类似于网页开发中的 HTML。

**WXML 和 HTML 的区别**

- 标签名称不同

- - HTML （div, span, img, a）
  - WXML（view, text, image, navigator）

- 属性节点不同

- - \<a href="#"\>超链接\</a\>
  - \<navigator url="/pages/home/home"\>\</navigator\>

- 提供了类似于 Vue 中的模板语法

- - 数据绑定、列表渲染、条件渲染

## WXSS样式

WXSS (WeiXin Style Sheets)是一套样式语言，用于描述 WXML 的组件样式，类似于网页开发中的 CSS。

**WXSS 和 CSS 的区别**

- 新增了 rpx 尺寸单位

- - CSS 中需要手动进行像素单位换算，例如 rem
  - WXSS 在底层支持新的尺寸单位 rpx，在不同大小的屏幕上小程序会自动进行换算

- 提供了全局的样式和局部样式

- - 项目根目录中的 app.wxss 会作用于所有小程序页面
  - 局部页面的 .wxss 样式仅对当前页面生效

- WXSS 仅支持部分 CSS 选择器

- - class 和 #id
  - element
  - 并集选择器、后代选择器
  - ::after 和 ::before 等伪类选择器

## JS 逻辑交互

**小程序中的 js 文件**

一个项目仅仅提供界面展示是不够的，在小程序中，我们通过 .js 文件来处理用户的操作。例如：响应用户的点击、获取用户的位置等等。

**小程序中 js 文件的分类**

小程序中的 JS 文件分为三大类，分别是：

- **app.js**：是整个小程序项目的入口文件，通过调用 App() 函数来启动整个小程序
- **页面的 js 文件**：是页面的入口文件，通过调用 Page() 函数来创建并运行页面
- **普通的 js 文件**：是普通的功能模块文件，用来封装公共的函数或属性供页面使用

## 运行机制

**小程序启动的过程**

- 把小程序的代码包下载到本地
- 解析 app.json 全局配置文件
- 执行 app.js 小程序入口文件，调用 App() 创建小程序实例
- 渲染小程序首页
- 小程序启动完成

**页面渲染的过程**

- 加载解析页面的 .json 配置文件
- 加载页面的 .wxml 模板和 .wxss 样式
- 执行页面的 .js 文件，调用 Page() 创建页面实例
- 页面渲染完成

## 组件

**小程序中组件的分类**

小程序中的组件也是由宿主环境提供的，开发者可以基于组件快速搭建出漂亮的页面结构。官方把小程序的组件分为了 9 大类，分别是：视图容器、基础内容、表单组件、导航组件、媒体组件、map 地图组件、canvas 画布组件、开放能力、无障碍访问

**常用的视图容器类组件**

- view

- - 普通视图区域
  - 类似于 HTML 中的 div，是一个块级元素
  - 常用来实现页面的布局效果

- scroll-view

- - 可滚动的视图区域
  - 常用来实现滚动列表效果

- swiper 和 swiper-item

- - 轮播图容器组件 和 轮播图 item 组件

**常用的基础内容组件**

- text

- - 文本组件
  - 类似于 HTML 中的 span 标签，是一个行内元素

- rich-text

- - 富文本组件
  - 支持把 HTML 字符串渲染为 WXML 结构

**其它常用组件**

- button

- - 按钮组件
  - 功能比 HTML 中的 button 按钮丰富
  - 通过 open-type 属性可以调用微信提供的各种功能（客服、转发、获取用户授权、获取用户信息等）

- image

- - 图片组件
  - image 组件默认宽度约 300px、高度约 240px

- navigator（后面课程会专门讲解）

- - 页面导航组件
  - 类似于 HTML 中的 a 链接

## API

**小程序 API 概述**

小程序中的 API 是由宿主环境提供的，通过这些丰富的小程序 API，开发者可以方便的调用微信提供的能力，例如：获取用户信息、本地存储、支付功能等。

**小程序 API 的 3 大分类**

小程序官方把 API 分为了如下 3 大类：

- 事件监听 API

- - 特点：以 on开头，用来监听某些事件的触发
  - 举例：wx.onWindowResize(function callback) 监听窗口尺寸变化的事件

- 同步 API

- - 特点1：以 Sync结尾的 API 都是同步 API
  - 特点2：同步 API 的执行结果，可以通过函数返回值直接获取，如果执行出错会抛出异常
  - 举例：wx.setStorageSync('key', 'value') 向本地存储中写入内容

- 异步 API

- - 特点：类似于 jQuery 中的 $.ajax(options) 函数，需要通过 success、fail、complete 接收调用的结果
  - 举例：wx.request() 发起网络数据请求，通过 success 回调函数接收数据
