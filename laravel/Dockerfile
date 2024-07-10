ARG COMPOSER_VERSION="2.7"
ARG PHP_VERSION="8.3"
ARG NODE_VERSION="20.12"
ARG NPM_VERSION="10.2"

FROM composer:${COMPOSER_VERSION} AS composer

FROM aniftyco/php
ARG NODE_VERSION
ARG NPM_VERSION
LABEL Maintainer="NiftyCo, LLC <support@aniftyco.com>"
LABEL Description="Lightweight Alpine Linux container with Caddy, PHP & Node for Laravel"

USER root

RUN mkdir -p /.composer && chown -R nobody.nobody /.composer
RUN mkdir -p /.npm && chown -R nobody.nobody /.npm

RUN apk add --no-cache \
    nodejs=~${NODE_VERSION} \
    npm=~${NPM_VERSION}

COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY Caddyfile /etc/caddy/Caddyfile

USER nobody

COPY --chown=nobody index.php /app/public/