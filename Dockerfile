FROM php:8.4-fpm-alpine

ENV TZ=Asia/Shanghai

RUN set -eux; \
    # 安装运行时和构建依赖
    apk add --no-cache tzdata libpng-dev libzip-dev oniguruma-dev; \
    # 安装 WordPress 必备扩展
    docker-php-ext-install mysqli pdo_mysql gd zip mbstring opcache; \
    # 清理缓存
    rm -rf /var/cache/apk/* /tmp/*

COPY . /app
WORKDIR /app

ENTRYPOINT ["php", "-S", "0.0.0.0:80", "-t", "/app"]
