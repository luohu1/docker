FROM centos:7

LABEL maintainer="LuoHui <mylhmail@163.com>" version="1.0" license="MIT"

RUN set -ex \
    && yum groupinstall -y "Development Tools" \
    && yum install -y bash-completion git vim-enhanced \
    && yum clean all \
    && rm -rf /var/cache/yum /tmp/* /var/tmp/*
