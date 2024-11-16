# region A02
git -v
git --version

git --html-path
git --man-path
git --info-path 
git --exec-path

git --exec-path=/path/to/new/executable/path

git -h
git --help
# endregion A02

# region A03
git config --global user.name "John"
git config --global user.email "123456@qq.com"
cat ~/.gitconfig
# endregion A03

# region A04
git init 
git status

echo "Hello, World!" > newfile.txt
git add newfile.txt
git commit -m "my first commit"

git branch -M main

git remote -v
git remote add origin <仓库地址>
git push -u origin main

git reflog
git log
git reset --hard <版本号>
# endregion A04

# region A05
git init
git init <directory>
git init --bare
git init --template=/path/to/template-directory
git init --quiet
git init --initial-branch=main
# endregion A05

# region A06
git fetch
git fetch <remote>
git fetch <remote> <branch>
# endregion A06

# region A07
git checkout <branch_name>
git checkout -b <new_branch_name>
# endregion A07