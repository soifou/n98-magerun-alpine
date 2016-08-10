FROM alpine:edge
MAINTAINER François Fleur <fleur.fr@gmail.com>

RUN apk add --no-cache --repository "http://dl-cdn.alpinelinux.org/alpine/edge/testing" \
    wget \
    less \
    mysql-client \
    php5-cli \
    php5-ctype \
    php5-curl \
    php5-dom \
    php5-iconv \
    php5-json \
    php5-pdo \
    php5-pdo_mysql \
    php5-phar \
    php5-posix \
    php5-zlib

COPY php.ini /etc/php

RUN mkdir /usr/local/share/php && cd /usr/local/share/php && \
    wget https://files.magerun.net/n98-magerun.phar && \
    chmod +x n98-magerun.phar && \
    ln -s /usr/local/share/php/n98-magerun.phar /usr/local/bin/n98-magerun

ENTRYPOINT ["n98-magerun", "--skip-root-check", "--root-dir=/mnt"]