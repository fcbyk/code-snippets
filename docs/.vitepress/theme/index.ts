import type { Theme } from 'vitepress'
import DefaultTheme from 'vitepress/theme'
import '../style/index.scss'

export default {
  extends: DefaultTheme,
  enhanceApp() {
  },
} satisfies Theme