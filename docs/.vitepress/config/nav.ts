import { DefaultTheme } from "vitepress";

export const nav: DefaultTheme.NavItem[] = [
    {
        text:"前端",
        link:"/fe/framework-vue"
    },
    {
        text:"408",
        items:[
            {
                text:"数据结构",
                link:"/ds/index"
            },
            {
                text:"操作系统",
                link:"/os/sf-docker"
            }
        ]
    }
]