FROM centos:7

MAINTAINER Nginx PHP CentOS

RUN yum -y install epel-release \
    && yum -y install supervisor nginx php-fpm \
    && yum clean all

RUN mkdir /web

VOLUME ["/web"]

COPY etc/supervisord.d/supervisord.ini /etc/supervisord.d/supervisord.ini
COPY etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY etc/php-fpm.d/www.conf /etc/php-fpm.d/www.conf

EXPOSE 80 443

CMD ["/usr/bin/supervisord"]
