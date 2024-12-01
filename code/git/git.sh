# region option
git -v
git --version

git -h
git --help
# endregion option

# region path
git --html-path
git --man-path
git --info-path 
git --exec-path
git --exec-path=/path/to/new/executable/path
# endregion path

# region user
git config --global user.name "John"
git config --global user.email "123456@qq.com"
cat ~/.gitconfig
# endregion user

# region init
git init
git init <directory>
git init --bare
git init --template=/path/to/template-directory
git init --quiet
git init --initial-branch=main
# endregion init

# region fetch
git fetch
git fetch <remote>
git fetch <remote> <branch>
# endregion fetch

# region checkout
git checkout <branch_name>
git checkout -b <new_branch_name>
# endregion checkout