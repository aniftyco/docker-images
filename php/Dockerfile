ARG ALPINE_VERSION="3.19"
ARG CADDY_VERSION="2.7"
ARG PHP_VERSION="8.3"
ARG COMPOSER_VERSION="2.7"

FROM alpine:${ALPINE_VERSION}
ARG CADDY_VERSION
ARG COMPOSER_VERSION
LABEL Maintainer="NiftyCo, LLC <support@aniftyco.com>"
LABEL Description="Lightweight Alpine Linux container with Caddy & PHP"

WORKDIR /app

RUN apk add --no-cache \
  curl \
  caddy=~${CADDY_VERSION} \
  composer=~${COMPOSER_VERSION} \
  php83 \
  php83-ctype \
  php83-curl \
  php83-dom \
  php83-fileinfo \
  php83-fpm \
  php83-gd \
  php83-intl \
  php83-mbstring \
  php83-opcache \
  php83-openssl \
  php83-pcntl \
  php83-pdo_pgsql \
  php83-pgsql \
  php83-phar \
  php83-session \
  php83-tokenizer \
  php83-xml \
  php83-xmlreader \
  php83-xmlwriter \
  supervisor

COPY Caddyfile /etc/caddy/Caddyfile

ENV PHP_INI_DIR /etc/php83
COPY fpm-pool.conf ${PHP_INI_DIR}/php-fpm.d/www.conf
COPY php.ini ${PHP_INI_DIR}/conf.d/custom.ini

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN mkdir -p /.composer && chown -R nobody.nobody /.composer
RUN chown -R nobody.nobody /app /run /.composer

COPY entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint

USER nobody

COPY --chown=nobody index.php /app/

EXPOSE 8080

ENTRYPOINT ["/usr/bin/entrypoint"]