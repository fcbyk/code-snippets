# 拉取 Redis 镜像
docker pull redis

#  启动 Redis 容器
docker run --name my-redis -d redis

# 连接到 Redis 容器
docker exec -it my-redis-container redis-cli