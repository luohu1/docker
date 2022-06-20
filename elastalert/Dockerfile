FROM alpine:3.13

LABEL maintainer="LuoHui <mylhmail@163.com>" version="1.0" license="MIT"

ENV TIMEZONE=${timezone:-"Asia/Shanghai"}

RUN set -ex \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache tzdata \
    && ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man

WORKDIR /elastalert

ENV ELASTALERT_VERSION 0.2.4

RUN set -eux \
    && apk add --no-cache python3 python3-dev libffi-dev libnsl-dev \
    && apk add --no-cache --virtual .build-deps gcc musl-dev \
    && python3 -m ensurepip \
    && python3 -m pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ \
    && python3 -m pip install --upgrade pip \
    && python3 -m pip install "setuptools>=11.3" \
    && python3 -m pip install "elasticsearch>=5.0.0" \
    && python3 -m pip install "elastalert==${ELASTALERT_VERSION}" \
    && apk del --no-network .build-deps

CMD ["elastalert", "--verbose"]
