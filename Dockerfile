FROM alpine:edge
MAINTAINER François Fleur <fleur.fr@gmail.com>

RUN apk add --no-cache --repository "http://dl-cdn.alpinelinux.org/alpine/edge/testing" \
    wget \
    less \
    mysql-client \
    php7 \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-iconv \
    php7-json \
    php7-pdo \
    php7-pdo_mysql \
    php7-phar \
    php7-posix \
    php7-zlib

RUN ln -s /etc/php7 /etc/php && \
    ln -s /usr/bin/php7 /usr/bin/php && \
    ln -s /usr/lib/php7 /usr/lib/php

COPY rootfs/ /

RUN mkdir /usr/local/share/php && cd /usr/local/share/php && \
    wget https://files.magerun.net/n98-magerun.phar && \
    chmod +x n98-magerun.phar && \
    ln -s /usr/local/share/php/n98-magerun.phar /usr/local/bin/n98-magerun

ENTRYPOINT ["n98-magerun", "--skip-root-check", "--root-dir=/mnt"]