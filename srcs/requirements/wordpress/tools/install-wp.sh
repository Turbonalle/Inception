#!/bin/bash

if [ ! -d "/var/www/wordpress/wp-admin" ]
then
sleep 10
wp core download --allow-root

wp config create --allow-root \
	--dbname=$DB_NAME \
	--dbuser=$DB_USER \
	--dbpass=$DB_PASS \
	--dbhost=mariadb:3306

wp core install --allow-root \
	--title=myTitle \
	--admin_user=$WP_ADMIN_NAME \
	--admin_password=$WP_ADMIN_PASS \
	--admin_email=$WP_ADMIN_EMAIL \
	--skip-email \
	--url='jbagger.42.fr'

wp user create --allow-root \
	$WP_USER_NAME \
	$WP_USER_EMAIL \
	--user_pass=$WP_USER_PASS

fi

path="/run/php"

if [ ! -d "$path" ]; then
	mkdir -p "$path"
fi

/usr/sbin/php-fpm7.4 -F