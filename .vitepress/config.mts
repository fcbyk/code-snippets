import { DefaultTheme, defineConfig } from 'vitepress'
import { sidebar } from './config/sidebar'
import { nav } from './config/nav'
import { search } from './config/search'

export default defineConfig({

  srcDir: "docs",

  outDir: "dist",

  title: "SNIPPETS",

  lastUpdated: true,

  head: [
    ['link', { rel: 'manifest', href: '/manifest.webmanifest' }],
    ['meta', { name: 'apple-mobile-web-app-capable', content: 'yes' }],
    ['meta', { name: 'apple-mobile-web-app-status-bar-style', content: 'default' }],
    ['meta', { name: 'msapplication-TileImage', content: '/logo.svg' }],
    ['link', { rel: 'apple-touch-icon', href: '/logo.svg' }],
    ['link', { rel: 'mask-icon', href: '/logo.svg', color: '#3eaf7c' }],
    ['link', { rel: 'icon', href: '/logo.svg', type: 'image/svg+xml' }],
    ['link', { rel: 'stylesheet', href: 'https://cdn.bootcdn.net/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' }],
  ],

  cleanUrls: true,
  metaChunk:true,

  themeConfig: {

    logo: "/logo.svg",

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

    editLink: {
      pattern: 'https://github.com/fcbyk/code-snippets/tree/main/docs/:path',
      text: '在 GitHub 上编辑此页面'
    },

    lastUpdated: {
      text: '最后更新于',
      formatOptions: {
        dateStyle: 'short',
        timeStyle: 'medium'
      }
    },

    sidebar,
    nav,
    search,
  }
})
