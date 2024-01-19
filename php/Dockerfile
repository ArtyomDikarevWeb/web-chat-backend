FROM php:8.2-fpm-alpine

RUN apk add --no-cache curl git build-base zlib-dev oniguruma-dev autoconf bash

RUN docker-php-ext-install pdo pdo_mysql

RUN apk add --update linux-headers
RUN pecl install xdebug && docker-php-ext-enable xdebug

COPY ./php/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

ARG PUID=1000
ARG PGID=1000
RUN apk --no-cache add shadow && \
    groupmod -o -g ${PGID} www-data && \
    usermod -o -u ${PUID} -g www-data www-data

WORKDIR /var/www/web-chat-backend