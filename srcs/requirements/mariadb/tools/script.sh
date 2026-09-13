#!/bin/bash

# MYSQL_PASSWORD=$(cat /run/secrets/mysql_password)
# MYSQL_ROOT_PASSWORD=$(cat /run/secrets/mysql_root_password)

#ERROR: 1290  The MariaDB server is running with the --skip-grant-tables option so it cannot execute this statement
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Database not found. Initializing..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi
    mysqld --user=mysql --bootstrap << EOF
    FLUSH PRIVILEGES;
    CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
    CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
EOF


exec mysqld --user=mysql