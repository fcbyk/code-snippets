// project.config.json 文件注释
// project.private.config.json 类似，只是会覆盖 project.config.json 相同字段

export interface ProjectConfig{

  // 编译类型,分普通小程序项目和小程序插件项目
  compileType: "miniprogram" | "plugin",

  // 基础库版本
  libVersion: "latest" | "trial" | "widelyUsed" | string,

  // 打包配置选项
  packOptions: packOptions,

  // 项目设置
  setting: setting,

  // 官方文档没有解释
  condition: object,

  // 指定自动生成的文件的 tabIndent 和 tabSize
  editorSetting: editorSetting,

  // 项目的 appid
  appid: string
}


interface packOptions{
  ignore: {
    type: "file" | "folder" | "suffix" | "prefix" | "glob" | "regexp";
    value: string;
  }[],
  include: {
    type: "file" | "folder" | "suffix" | "prefix" | "glob" | "regexp";
    value: string;
  }[]
}

interface setting{
  coverView: boolean, // 是否使用工具渲染 CoverView
  es6: boolean, // 是否启用 es6 转 es5
  postcss: boolean, // 上传代码时样式是否自动补全
  minified: boolean, // 上传代码时是否自动压缩脚本文件
  enhance: boolean, // 上传代码时是否自动压缩样式文件
  showShadowRootInWxmlPanel: boolean, // 是否开启调试器 WXML 面板展示 shadow-root
  packNpmRelationList: [], // 仅 packNpmManually 为 true 时生效

  // 将 JS 编译为 ES5 时 Babel 的配置项
  babelSetting: {
    ignore: Array<string>,
    disablePlugins: [],
    outputPath: string
  }
}

interface editorSetting{
  tabIndent: string,
  tabSize: number
}