import type { Theme } from 'vitepress'
import DefaultTheme from 'vitepress/theme'
import '../style/index.scss'
import ID from '../components/ID.vue'

export default {
    extends: DefaultTheme,
    enhanceApp({ app }) {
      app.component('ID',ID)
    }
  } satisfies Theme