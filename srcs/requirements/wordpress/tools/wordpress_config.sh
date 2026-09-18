#!/bin/bash

cd /var/www/html
sleep 10

if [ ! -f "wp-config.php" ]; then

    wp core download --allow-root

    wp config create \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost=mariadb:3306 \
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
fi

chown -R www-data:www-data /var/www/html

exec php-fpm8.2 -F