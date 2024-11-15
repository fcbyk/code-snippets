# region 0002
docker run -d \
  --name nginx \
  --network code-server-network
  -p 80:80 \
  -p 443:443 \
  -v /usr/nginx/static:/etc/nginx/static \
  -v /usr/nginx/nginx.conf:/etc/nginx/nginx.conf \
  -v /usr/nginx/certs:/etc/nginx/certs \
  -u "$(id -u):$(id -g)" \
  nginx:latest
# endregion 0002

# region 0002-1
docker run -d \
  --name code-server \
  --network code-server-network \
  -v "/usr/code-server/.config:/home/coder/.config" \
  -v "/usr/code-server/project:/home/coder/project" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  -e "PASSWORD=123456" \
  -p 8080:8080 \
  -p 5173:5173 \
  -p 5174:5174 \
  codercom/code-server:latest
# endregion 0002-1