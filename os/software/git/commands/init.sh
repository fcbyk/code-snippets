# git init 命令用于初始化一个新的Git仓库。它会在当前目录创建一个新的 .git 子目录，其中包含初始化的Git仓库的所有必要文件和结构
# 这个命令可以在现有的项目目录中使用，以便将其转换为Git仓库
git init

# 在当前目录下创建名为 <directory> 的目录，并在该目录中初始化一个 Git 仓库。
# 如果 <directory> 目录不存在，Git 会自动创建它；如果 <directory> 目录已经存在，则会在现有目录中初始化 Git 仓库。
git init <directory>

# 以下为init命令的选项

# --bare
# 创建一个裸仓库。裸仓库没有工作目录，只有Git的版本控制数据。裸仓库通常用作远程仓库，用于共享项目
git init --bare

# --template=<template-directory>
# 指定一个模板目录，用于自定义初始化仓库时使用的文件和目录
# 模板目录中的所有文件和目录将被复制到新仓库的.git目录中。
git init --template=/path/to/template-directory

# [-q | --quiet] 
# 安静模式。执行命令时不输出任何信息
git init --quiet

# [-b <branch-name> | --initial-branch=<branch-name>]
# 指定初始化仓库时创建的默认分支的名称
# 默认分支通常是master或main，但可以通过这个选项指定其他名称。
git init --initial-branch=main
