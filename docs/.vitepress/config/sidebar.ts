import { DefaultTheme } from "vitepress";

// 主页目录
const index: DefaultTheme.SidebarItem[] = [];

// 前端目录
const fe: DefaultTheme.SidebarItem[] = [
  {
    text: "前端",
    items: [
      {
        text: "HTML",
        link: "/fe/html",
      },
      {
        text: "样式",
        base: "/fe/style-",
        items: [
          { text: "CSS", link: "css" },
          { text: "Less", link: "less" },
          { text: "Sass", link: "sass" },
        ],
      },
      {
        text: "JavaScript",
        link: "/fe/js",
      },
      {
        text: "TypeScript",
        link: "/fe/ts",
      },
      {
        text: "框架",
        base: "/fe/framework-",
        items: [{ text: "Vue", link: "vue" }],
      },
    ],
  },
];

// 后端目录
const be: DefaultTheme.SidebarItem[] = [
  {
    text: "后端",
    items: [
      {
        text: "Java",
        link: "/be/java",
        items: [
          {
            text: "MyBaits",
            link: "/be/mb",
          },
          {
            text: "Spring",
            link: "/be/spring",
          },
        ],
      },  
    ],
  },
];

// 操作系统目录
const os: DefaultTheme.SidebarItem[] = [
  {
    text: "操作系统",
    items: [
      {
        text: "软件",
        base: "/os/sf-",
        items: [
          {
            text: "Docker",
            link: "docker",
          },
          {
            text: "Git",
            link: "git",
          },
          {
            text: "Nginx",
            link: "nginx",
          },
        ],
      },
      {
        text: "数据库",
        base: "/os/db-",
        items: [
          {
            text: "MySQL",
            link: "mysql",
          },
          {
            text: "Redis",
            link: "redis",
          },
        ],
      },
    ],
  },
];

export const sidebar: DefaultTheme.Sidebar = {
  "/": index,
  "/fe/": fe,
  "/be/": be,
  "/os/": os,
};
