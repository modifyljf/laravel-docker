ARG PHPVERSION

FROM php:${PHPVERSION}-fpm

# Set working directory
WORKDIR /var/www

RUN apt-get update && apt-get upgrade -y

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions  \
    bcmath \
    curl \
    pgsql \
    pcov \
    gd \
    imagick \
    imap \
    mbstring \
    xml \
    zip \
    soap \
    intl \
    ldap \
    msgpack \
    igbinary \
    memcached \
    swoole \
    tidy \
    readline \
    xdebug \
    pdo_mysql \
    exif \
    pcntl \
    redis

# Install composer
RUN install-php-extensions @composer

# Configure php.ini configure
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
