echo "Starting MariaDB server...";
service mysql start;
echo "Creating database...";
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
echo "Creating user and granting privileges...";
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
echo "Creating user and granting privileges...";
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}`\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
echo "Setting root password...";
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
echo "Flushing privileges...";
mysql -e "FLUSH PRIVILEGES;"

echo "Shutting down MariaDB server...";
mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown;
echo "MariaDB server has been shut down.";
exec mysqld_safe;
echo "script finished";