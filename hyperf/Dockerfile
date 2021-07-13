FROM hyperf/hyperf:7.4-alpine-v3.12-swoole-v4.6.7
LABEL maintainer="LuoHui <mylhmail@163.com>" version="1.0" license="MIT" app.name="Hyperf"

ARG timezone

ENV TIMEZONE=${timezone:-"Asia/Shanghai"} \
    APP_ENV=online \
    SCAN_CACHEABLE=(true)

RUN set -ex \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache tzdata \
    && ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man

COPY docker-php-entrypoint /usr/local/bin/

RUN set -eux \
    # php extension:deps
    && apk update \
    && apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        rabbitmq-c-dev \
    && ln -s /usr/bin/phpize7 /usr/local/bin/phpize \
    && ln -s /usr/bin/php-config7 /usr/local/bin/php-config \
    # php extension:build
    && cd /tmp \
    && curl -fsSL 'https://pecl.php.net/get/amqp-1.10.2.tgz' -o amqp.tar.gz \
    && mkdir -p /tmp/amqp \
    && tar -xf amqp.tar.gz -C /tmp/amqp --strip-components=1 \
    && rm amqp.tar.gz \
    && ( \
        cd amqp \
        && phpize \
        && ./configure \
        && make -j "$(nproc)" \
        && make install \
    ) \
    && rm -r amqp \
    # php extension:config
    && { \
        echo "date.timezone=${TIMEZONE}"; \
        echo "memory_limit=1G"; \
        echo "upload_max_filesize=128M"; \
        echo "post_max_size=128M"; \
        echo ""; \
        echo "extension=amqp"; \
    } | tee /etc/php7/conf.d/99_overrides.ini \
    # ---------- clear works ----------
    && apk del --no-network .build-deps \
    && runDeps="$( \
        scanelf --needed --nobanner --format '%n#p' --recursive /usr/lib/php7/modules \
            | tr ',' '\n' \
            | sort -u \
            | awk 'system("[ -e /usr/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
    )" \
    && apk add --no-cache $runDeps \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/local/bin/php* \
    && echo -e "\033[42;37m Build PHP Extentions Completed :).\033[0m\n"

ENTRYPOINT ["docker-php-entrypoint"]
CMD ["php", "-a"]
