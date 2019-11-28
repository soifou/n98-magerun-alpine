FROM alpine:3.9

ENV PHP_VERSION 7.3

ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN echo "https://dl.bintray.com/php-alpine/v3.9/php-$PHP_VERSION" >> /etc/apk/repositories && \
    apk add --update --no-cache \
    ca-certificates \
    curl \
    mariadb-client \
    php7 \
    php7-ctype \
    php7-iconv \
    php7-json \
    php7-mbstring \
    php7-mysqli \
    php7-pdo \
    php7-pdo_mysql \
    php7-phar \
    php7-posix \
    php7-zip \
    php7-zlib

RUN ln -sf /usr/bin/php7 /usr/bin/php

RUN rm -rf /tmp/src && \
    rm -rf /var/cache/*

COPY php.ini /etc/php7/conf.d/50_custom.ini

RUN curl -L https://files.magerun.net/n98-magerun.phar > /usr/local/bin/magerun && \
    chmod +x /usr/local/bin/magerun

ENTRYPOINT ["magerun", "--skip-root-check", "--root-dir=/mnt"]
