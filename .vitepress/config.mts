import { DefaultTheme, defineConfig } from 'vitepress'
import { sidebar } from './config/sidebar'
import { nav } from './config/nav'
import { search } from './config/search'

export default defineConfig({

  srcDir: "docs",

  outDir: "dist",

  title: "代码片段",

  head: [
    ['meta', { name: 'theme-color', content: '#ffffff' }],
    ['link', { rel: 'manifest', href: '/manifest.webmanifest' }],
    ['meta', { name: 'theme-color', content: '#ffffff' }],
    ['meta', { name: 'apple-mobile-web-app-capable', content: 'yes' }],
    ['meta', { name: 'apple-mobile-web-app-status-bar-style', content: '#ffffff' }],
    ['meta', { name: 'msapplication-TileColor', content: '#ffffff' }],
    ['meta', { name: 'msapplication-TileImage', content: '/icon.png' }],
    ['link', { rel: 'apple-touch-icon', href: '/icon.png' }],
    ['link', { rel: 'mask-icon', href: '/icon.png', color: '#3eaf7c' }],
    ['link', { rel: 'stylesheet', href: 'https://cdn.bootcdn.net/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' }]
  ],

  cleanUrls: true,

  themeConfig: {

    socialLinks: [
      { icon: 'github', link: 'https://github.com/fcbyk/code-snippet' }
    ],

    darkModeSwitchLabel: "夜间模式",
    sidebarMenuLabel: "文档",
    returnToTopLabel: "返回顶部",
    outlineTitle: "目录",

    docFooter: {
      prev: '上一篇',
      next: '下一篇'
    },

    sidebar,
    nav,
    search,
  }
})
