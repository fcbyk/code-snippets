# git checkout 主要用于在不同的分支之间进行切换，以及在工作目录中恢复文件的状态

# 这会将当前工作目录切换到指定的 <branch_name> 分支
# 在切换分支时，Git 会自动更新工作目录中的文件，以确保它们与目标分支的内容一致。
git checkout <branch_name>

# 以下为该命令的选项

# -b
# 这会创建一个名为 <new_branch_name> 的新分支，并将工作目录切换到该分支上。
git checkout -b <new_branch_name>



