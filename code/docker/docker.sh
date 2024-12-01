# 全局
# region option
docker -v
docker --version
# endregion option

# region hub
docker info
vim /etc/docker/daemon.json
sudo systemctl restart docker
# endregion hub

# 镜像
# region pull
docker pull ubuntu:latest
docker pull mysql:8.0
docker pull -a ubuntu
# endregion pull

# region images
docker images
docker images ubuntu
docker images -q
# endregion images

# region search
docker search nginx
docker search --limit 5 nginx
docker search --no-trunc nginx
docker search --filter is-official=true stars=50 nginx
# endregion search

# region rmi
docker rmi ubuntu:latest
docker rmi <image_id>
docker rmi <image_id1> <image_id2> <image_id3>
docker rmi -f 1234567890ab
docker rmi $(docker images -q)
# endregion rmi

# region build
# 编写 Dockerfile
docker build .
docker build -t my-image:1.0 .
docker build -f path/to/Dockerfile .
docker build -f path/to/Dockerfile /path/to/build/context
docker build --platform linux/arm64 .
# endregion build

# region tag
docker tag my-image my-image:dev
docker tag my-image my-image:test
docker tag my-image my-image:prod
# endregion tag

# 容器
# region ps
docker ps
docker ps -a
docker ps -l
docker ps -n 3

docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}"
docker ps --format json

docker ps -f status=running
docker ps -f ancestor=my-image
docker ps -f name=my-container
docker ps -f label=my-label
docker ps -f publish=8080
docker ps -f since=24h
# endregion ps

# region run
docker run \
  --name my-nginx \
  -d \
  -p 8080:80 \
  -v /data:/usr/share/nginx/html \
  nginx
  
docker run \
  --name my-container \
  --net=my-network \
  -p 8080:80 \
  -e MY_VAR=value \
  --restart always \
  --dns 8.8.8.8 \
  -m 512m \
  --cpus 0.5 \
  my-image:1.0
# endregion run

# region exec
docker exec my-container ls
docker exec -u www-data my-container ls

docker exec -e MY_VAR=value my-container env
docker exec -it my-container /bin/bash
# endregion exec

# region start
docker start mc1 mc2
docker stop mc1
docker restart mc1
# endregion start

# region rm
docker rm mc1
# endregion rm