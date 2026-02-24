## 构建镜像

docker build -t jackyfzc/wordpress:latest .

## 测试环境启动命令

docker stop wordpress-dev || true && docker rm wordpress-dev || true && docker run --name wordpress-dev -d -v Z:\\Git\\WordPress:/app -p 8080:80 jackyfzc/wordpress:latest
