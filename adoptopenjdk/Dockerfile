FROM adoptopenjdk/openjdk8:x86_64-alpine-jdk8u312-b07

LABEL maintainer="LuoHui <mylhmail@163.com>" version="1.0" license="MIT"

ENV LANG='zh_CN.UTF-8' LANGUAGE='zh_CN.UTF-8' LC_ALL='zh_CN.UTF-8'

RUN set -ex \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --no-cache tzdata \
    && ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man
