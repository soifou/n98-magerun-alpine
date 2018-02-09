FROM php:5.6-alpine

RUN apk upgrade -U && \
    apk add --no-cache --repository "http://dl-cdn.alpinelinux.org/alpine/edge/testing" \
        wget less \
        zlib-dev \
        mysql-client && \
    docker-php-ext-install \
        ctype \
        iconv \
        json \
        mbstring \
        mysqli \
        pdo \
        pdo_mysql \
        posix \
        zip && \
    rm -fr /var/cache/apk/*

COPY php.ini /usr/local/etc/php/conf.d/50-setting.ini

RUN mkdir /usr/local/share/php && cd /usr/local/share/php && \
    wget https://files.magerun.net/n98-magerun.phar && \
    chmod +x n98-magerun.phar && \
    ln -s /usr/local/share/php/n98-magerun.phar /usr/local/bin/n98-magerun

ENTRYPOINT ["n98-magerun", "--skip-root-check", "--root-dir=/mnt"]