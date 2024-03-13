FROM debian:buster

# update the package list
RUN apt-get update

# install nginx and curl
RUN apt-get install -y nginx curl

# create a directory to store the SSL certificate and key
RUN mkdir -p /etc/nginx/ssl

# generate a self-signed SSL certificate and key
RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/CN=jbagger/"

COPY conf/nginx.conf /etc/nginx/nginx.conf

# EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]