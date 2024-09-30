#!/bin/bash

# Check if WordPress core files are present
if [ ! -f /var/www/html/wp-load.php ]; then
    echo "WordPress core files not found. Downloading..."
    wp core download --allow-root
fi

# Check if wp-config.php exists
if [ ! -f /var/www/html/wp-config.php ]; then
    echo "wp-config.php not found. Creating..."
    cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
    sed -i "s/database_name_here/$WORDPRESS_DB_NAME/" /var/www/html/wp-config.php
    sed -i "s/username_here/$WORDPRESS_DB_USER/" /var/www/html/wp-config.php
    sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/" /var/www/html/wp-config.php
    sed -i "s/localhost/$WORDPRESS_DB_HOST/" /var/www/html/wp-config.php
fi

# Check if WordPress is installed
if ! wp core is-installed --allow-root; then
    echo "WordPress is not installed. Installing..."
    wp core install --url=$DOMAIN_NAME --title="WordPress Site" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root
fi

# Start PHP-FPM
exec php-fpm7.3 -F