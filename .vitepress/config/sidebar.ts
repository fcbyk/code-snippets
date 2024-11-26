import { DefaultTheme } from "vitepress";

// 主页目录
const index: DefaultTheme.SidebarItem[] = [];

// 前端目录
const frontend: DefaultTheme.SidebarItem[] = [
  {
    text: "前端",
    items: [
      {
        text: "HTML",
        link: "/frontend/html",
      },
      {
        text: "样式",
        base: "/frontend/style-",
        collapsed: true,
        items: [
          { text: "CSS", link: "css" },
          { text: "Less", link: "less" },
          { text: "Scss", link: "scss" },
        ],
      },
      {
        text: "JavaScript",
        link: "/frontend/js",
      },
      {
        text: "TypeScript",
        link: "/frontend/ts",
      },
      {
        text: "框架",
        base: "/frontend/framework-",
        collapsed: true,
        items: [
          { text: "Vue", link: "vue" },
        ],
      },
    ],
  },
];

const os: DefaultTheme.SidebarItem[] = [
  {
    text:"Docker",
    link:"/os/docker"
  }
]

export const sidebar: DefaultTheme.Sidebar = {
  "/": index,
  // "/frontend/": frontend,
  "/os/": os
};
