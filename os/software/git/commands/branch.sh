# Git 中用于管理分支的命令

# 运行 git branch 命令不带任何选项时，它会列出当前仓库中的所有分支，并在当前分支名字前面标注一个星号 *，表示当前所在的分支。
git branch

#  [-a | --all]
# 列出本地分支和远程分支
git branch -a
git branch --all

#  [-r | --remotes]
# 列出远程分支
git branch -r
git branch --remotes

# [-m | --move | -M ]
# 以重命名本地分支
git branch -m <old-branch-name> <new-branch-name> 
git branch --move <old-branch-name> <new-branch-name> 
# 将当前分支重命名为指定的新分支名字
git branch -m <new-branch-name> 
git branch --move <new-branch-name> 
# 强制重命名分支而不会提示警告
git branch -M <old-branch-name> <new-branch-name> 
# 将当前所在的分支重命名为 <new-branch-name>
git branch -M <new-branch-name>

# [-d | -D]
# 删除本地分支
# 如果分支有未合并的更改，Git 会拒绝删除它，并给出一个警告。
# 如果你确定要删除，并且知道删除后的影响，可以使用 -D 选项来强制删除
git branch -d <branch-name>
git branch -D <branch-name>
