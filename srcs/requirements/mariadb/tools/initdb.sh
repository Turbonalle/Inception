#!/bin/sh

# Prepare directories and rights
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

if [ -d "/var/lib/mysql/$DB_NAME" ]
then
	echo "Database already exists"
else
# init database
mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

# Enforce root pw, create db, add user, give rights
mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PASS';
CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;
CREATE USER \`$DB_USER\`@'%' IDENTIFIED by '$DB_PASS';
GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO \`$DB_USER\`@'%';
GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' WITH GRANT OPTION;
GRANT SELECT ON mysql.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

fi

exec mysqld --defaults-file=/etc/mysql/mariadb.conf.d/50-server.cnf