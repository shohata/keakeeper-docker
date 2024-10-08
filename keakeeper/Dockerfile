FROM alpine:3.20 as builder
ARG KEAKEEPER_URL="https://github.com/designet-inc-oss/KeaKeeper/releases/download/v1.05/keakeeper-1.05.tar.gz"
RUN apk add --update --no-cache curl
RUN mkdir -p /var/www/html
RUN curl -SL $KEAKEEPER_URL | tar -xzC /var/www/html

FROM nginx:alpine3.20 as keakeeper
RUN apk add --update --no-cache tzdata
RUN adduser -u 82 -D -S -G www-data www-data
COPY --from=builder /var/www/html/keakeeper /var/www/html/keakeeper
COPY default.conf /etc/nginx/conf.d/
RUN chown -R www-data:www-data /var/www/html/keakeeper

FROM php:8.1-fpm-alpine3.20 as keakeeper-php
RUN apk add --update --no-cache tzdata gettext \
    && apk add --update --no-cache --virtual .build-deps oniguruma-dev openssl-dev gettext-dev \
    && docker-php-ext-install pdo_mysql mysqli mbstring gettext \
    && apk del .build-deps
RUN adduser -u 100 -D -S -G www-data kea
COPY --from=builder /var/www/html/keakeeper /var/www/html/keakeeper
COPY php.ini /usr/local/etc/php/
COPY application.ini /var/www/html/keakeeper/config/
COPY kea-dhcp4.conf /etc/kea/
COPY kea-dhcp6.conf /etc/kea/
COPY kea-ctrl-agent.conf /etc/kea/
RUN chown -R www-data:www-data /var/www/html/keakeeper
