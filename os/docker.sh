# 全局选项
# region 01
docker -v
docker --version
# endregion 01

# 镜像
# region pull
docker pull ubuntu:latest
docker pull mysql:8.0
docker pull -a ubuntu
# endregion pull

# region images
docker images
# endregion images

# region search
docker search nginx
# endregion search

# region rmi
docker rmi ubuntu:latest
# endregion rmi

# region build
docker build -t my-image:v1
# endregion build

# region tag
docker tag ubuntu:latest my-ubuntu:v1
# endregion tag

