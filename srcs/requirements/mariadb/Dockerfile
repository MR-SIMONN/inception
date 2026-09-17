FROM debian:bookworm

RUN apt-get update && apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld

RUN sed -i 's|bind-address\s*=\s*127.0.0.1|bind-address = 0.0.0.0|' /etc/mysql/mariadb.conf.d/50-server.cnf 

COPY tools/script.sh /script.sh

RUN  chmod +x /script.sh  && mv /script.sh  /usr/local/bin/script

CMD ["script"]
