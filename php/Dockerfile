ARG ALPINE_VERSION="3.19"
ARG PHP_VERSION="8.3"
ARG CADDY_VERSION="2.8"

FROM alpine:${ALPINE_VERSION}
LABEL Maintainer="NiftyCo, LLC <support@aniftyco.com>"
LABEL Description="Lightweight Alpine Linux container with Caddy & PHP"

WORKDIR /app

RUN apk add --no-cache \
  curl \
  caddy \
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

# Configure Caddy
COPY Caddyfile /etc/caddy/Caddyfile

# Configure PHP-FPM
ENV PHP_INI_DIR /etc/php83
COPY fpm-pool.conf ${PHP_INI_DIR}/php-fpm.d/www.conf
COPY php.ini ${PHP_INI_DIR}/conf.d/custom.ini

# Configure Supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN chown -R nobody.nobody /app /run

# Create symlink for php
RUN ln -s /usr/bin/php83 /usr/bin/php

# Copy entrypoint script
COPY entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint

# Switch to use a non-root user from here on
USER nobody

# Add application
COPY --chown=nobody index.php /app/

# Expose the port nginx is reachable on
EXPOSE 8080

# Set entrypoint script
ENTRYPOINT ["/usr/bin/entrypoint"]