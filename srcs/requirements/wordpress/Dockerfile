FROM debian:bookworm

RUN apt-get update -y && apt-get install -y curl
 
RUN apt-get install -y php8.2-fpm php8.2-mysql

RUN apt-get install -y mariadb-client && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
    
RUN sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 9000|' /etc/php/8.2/fpm/pool.d/www.conf

COPY tools/wordpress_config.sh /usr/local/bin/wordpress_config.sh

RUN chmod +x /usr/local/bin/wordpress_config.sh

CMD ["wordpress_config.sh"]