FROM debian:buster

RUN apt update

# -y flag is used to skip the confirmation prompt (telling it yes to everything)
RUN apt install nginx -y

# create a directory to store the SSL certificate and key
RUN mkdir -p /etc/nginx/ssl

RUN apt install OpenSSL -y

RUN opessl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

RUN mkdir -p /var/run/html

COPY conf/nginx.conf /etc/nginx/nginx.conf