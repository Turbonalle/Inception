FROM debian:buster

# update package list
RUN apt-get update

# install php
RUN apt-get install -y \
	php-fpm \
	php-mysql \
	curl \

# remove package lists to minimize image size
RUN rm -rf /var/lib/apt/lists/*

# download and extract wordpress
RUN curl -o wordpress.tar.gz -SL https://wordpress.org/latest.tar.gz && \
	tar -xzvf wordpress.tar.gz -C /var/www/ && \
	rm wordpress.tar.gz

# 
RUN chown -R www-data:www-data /var/www/wordpress

# install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# 
EXPOSE 9000

CMD ["php-fpm", "-F"]