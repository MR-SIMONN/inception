FROM debian:12

RUN apt-get update -y && \
    apt-get install -y \
    curl \
    php8.2-fpm \
    php8.2-mysql \
    mariadb-client && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp
    
RUN sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 9000|' /etc/php/8.2/fpm/pool.d/www.conf

COPY tools/wp-config.sh /usr/local/bin/wp-config.sh

RUN chmod +x /usr/local/bin/wp-config.sh

WORKDIR /var/www/html

CMD ["wordpress_config.sh"]