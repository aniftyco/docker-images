ARG COMPOSER_VERSION="2.7"
ARG PHP_VERSION="8.3"

FROM composer:${COMPOSER_VERSION} AS composer

FROM aniftyco/php
LABEL Maintainer="NiftyCo, LLC <support@aniftyco.com>"
LABEL Description="Lightweight Alpine Linux container with Caddy, PHP & Node for Laravel"

USER root

COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY Caddyfile /etc/caddy/Caddyfile

USER nobody

COPY --chown=nobody index.php /app/public/