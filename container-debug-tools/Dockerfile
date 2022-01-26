FROM alpine:3.14
LABEL maintainer="LuoHui <mylhmail@163.com>" version="1.0" license="MIT"

ARG timezone

ENV TIMEZONE=${timezone:-"Asia/Shanghai"}

RUN set -ex \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache tzdata \
    && ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man
