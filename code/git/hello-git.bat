@echo off
chcp 65001 >nul
echo.
echo 本文件非脚本文件，请用记事本打开，可查看并选择性拷贝git相关命令
pause >nul

@REM 以下为git的快速使用

@REM 查看git版本
@REM 如不存在该命令，请前往官网下载或检查环境变量是否配置
git --version

@REM 设置用户签名
@REM 签名的作用是区分不同操作者身份。用户的签名信息在每一个版本的提交信息中能够看到，以此确认本次提交是谁做的。
@REM Git 首次安装必须设置一下用户签名，否则无法提交代码。
git config --global user.name "John"
git config --global user.email "123456@qq.com"

@REM 查看用户签名
cat ~/.gitconfig

@REM 初始化本地库
@REM 切换到项目的根目录，进行初始化，初始化完成后会生成.git隐藏文件夹
git init

@REM 查看本地库状态 
git status

@REM 创建一个新文件，并添加到暂存区，添加完可以查看本地库状态
echo "Hello, World!" > newfile.txt
git add newfile.txt

@REM 提交到本地库
@REM -m选项 表示后面跟着的是提交消息
git commit -m "my first commit"

@REM 将本地的分支重命名为main
@REM -M: 强制重命名当前分支。如果目标分支名已经存在，这个选项会覆盖目标分支。
git branch -M main

@REM 查看远程仓库信息
git remote -v

@REM 添加远程仓库
git remote add origin <仓库地址>

@REM 推送代码到远程仓库并设置上游引用
@REM 当你第一次将一个新分支推送到远程仓库时，使用 -u 选项设置该分支与远程分支的关联。
@REM 设置上游引用后，以后进行 git push 或 git pull 时，无需每次都指定远程分支名称
git push -u origin main

@REM 查看历史版本信息
git reflog

@REM 查看历史版本详细信息
git log

@REM 版本穿梭
@REM 使用版本号进行回退
git reset --hard <版本号>

