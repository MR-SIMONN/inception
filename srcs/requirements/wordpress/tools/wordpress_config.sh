#!/bin/bash

MYSQL_PASSWORD=$(cat /run/secrets/mysql_password)
WORDPRESS_PASSWORD=$(cat /run/secrets/wordpress_password)
WORDPRESS_ADMIN_PASSWORD=$(cat /run/secrets/wordpress_admin_password)

mariadb-admin ping -h"mariadb" -u "${MYSQL_USER}" -p"${MYSQL_PASSWORD}" --wait=60 --silent

if [ ! -f "wp-settings.php" ]; then
    echo "installing wordpress..."
    
    wp core download --allow-root
    wp config create \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost=mariadb \
        --allow-root
    wp core install \
        --url=$DOMAIN_NAME \
        --title="Inception" \
        --admin_user=$WORDPRESS_ADMIN_USER \
        --admin_password=$WORDPRESS_ADMIN_PASSWORD \
        --admin_email=$WORDPRESS_ADMIN_EMAIL \
        --allow-root
    wp user create $WORDPRESS_USER $WORDPRESS_EMAIL \
        --user_pass=$WORDPRESS_PASSWORD \
        --role=author \
        --allow-root
        
    echo "wordpress is installed and ready!"
else
    echo "wordpress is already installed."
fi

chown -R www-data:www-data /var/www/html

exec php-fpm8.2 -F