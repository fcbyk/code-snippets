## git是什么
<a href="https://git-scm.com/" style="margin-right: 5px;">git官网</a>
<a href="https://git-scm.com/docs" style="margin-right: 5px;">git官方文档</a>
<a href="https://www.bilibili.com/video/BV1vy4y1s7k6/?spm_id_from=333.999.0.0" style="margin-right: 5px;">视频学习参考</a>
<a href="https://www.conventionalcommits.org/zh-hans/v1.0.0/" style="margin-right: 5px;">约定式提交</a>
<a href="https://github.com/pvdlg/conventional-changelog-metahub#commit-types" style="margin-right: 5px;">完整提交类型列表</a>

Git 是一个免费的、开源的分布式版本控制系统，可以快速高效地处理从小型到大型的各种 项目。 Git 易于学习，占地面积小，性能极快。 它具有廉价的本地库，方便的暂存区域和多个工作 流分支等特性。其性能优于 Subversion、CVS、Perforce 和 ClearCase 等版本控制工具。

## git的命令

```
usage: git [-v | --version]
           [-h | --help]
           [-C <path>]
           [-c <name>=<value>]
           [--exec-path[=<path>]]
           [--html-path]
           [--man-path]
           [--info-path]
           [-p | --paginate | -P | --no-pager]
           [--no-replace-objects]
           [--bare]
           [--git-dir=<path>]
           [--work-tree=<path>]
           [--namespace=<name>]
           [--super-prefix=<path>]
           [--config-env=<name>=<envvar>]
           <command> [<args>]
           
        选项（Options）：
        -v, --version 显示 Git 版本信息
        -h, --help 显示 Git 命令的帮助信息
        -C <path> 设置 Git 命令的工作目录
        -c <name>=<value> 设置配置选项
        --exec-path[=<path>] 显示 Git 执行程序的路径
        --html-path 显示 Git HTML 文档的路径
        --man-path 显示 Git 手册页的路径
        --info-path 显示 Git info 页面的路径
        -p, --paginate 通过分页器查看输出结果
        -P, --no-pager 禁用分页器查看输出结果
        --no-replace-objects 在 Git GC（垃圾收集）时不替换对象
        --bare 创建一个裸仓库（不包含工作树）
        --git-dir=<path> 设置 Git 仓库的路径
        --work-tree=<path> 设置工作树的路径
        --namespace=<name> 设置 Git 命名空间
        --super-prefix=<path> 设置 Git 执行命令的超级前缀
        --config-env=<name>=<envvar> 设置配置选项的环境变量

        命令（Commands）：
        <command> [<args>] 执行的 Git 命令及其参数
```

**命令说明约定**

- 方括号 "[]"：方括号表示选项是可选的。你可以根据需要选择是否使用这些选项。例如，`git commit [-a] [-m <message>]` 表示 `-a` 选项是可选的，而 `-m <message>` 中的 `<message>` 参数是必需的。

- 尖括号 "<>"：尖括号表示参数是必需的。你需要提供命令执行所需的具体值。例如，`git clone <repository>` 表示 `<repository>` 参数是必需的，你需要提供要克隆的存储库的 URL 或路径。

- 省略号 "..."：省略号表示可以重复多次相同的参数或命令。例如，`git add <file>...` 表示可以一次性添加多个文件，如 `git add file1 file2 file3`。

- 竖线 "|"：竖线表示在选项或参数之间进行选择。你可以从多个选项或参数中选择一个。例如，`git branch (-d | -D) <branch>` 表示你可以使用 `-d` 或 `-D` 选项来删除分支。

