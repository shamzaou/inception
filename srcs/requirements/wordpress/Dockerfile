FROM debian:buster

RUN apt-get update && apt-get install -y \
    php7.3 \
    php7.3-fpm \
    php7.3-mysql \
    php7.3-json \
    php7.3-curl \
    php7.3-gd \
    php7.3-intl \
    php7.3-mbstring \
    php7.3-xml \
    php7.3-zip \
    wget \
    curl

# Install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Create necessary directories
RUN mkdir -p /var/www/html /run/php

WORKDIR /var/www/html

# Set up wp-config.php
COPY tools/wp-config.php /var/www/html/wp-config.php

# Configure PHP-FPM
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html /run/php

EXPOSE 9000

# Create a startup script
COPY tools/start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]