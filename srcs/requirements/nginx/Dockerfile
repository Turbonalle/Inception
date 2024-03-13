FROM debian:buster

RUN apt update && apt install -y nginx openssl

# create a directory to store the SSL certificate and key
RUN mkdir -p /etc/nginx/ssl

# generate a self-signed SSL certificate and key
RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FI/ST=Helsinki/L=Helsinki/O=Hive/OU=jbagger/CN=jbagger/"
# key and TLS certificate are now generatedqq

RUN mkdir -p /var/run/html

# COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/sites-available/default
COPY conf/nginx.conf /etc/nginx/nginx.conf

# our main root
RUN chmod 755 /var/www/html

# the main user
RUN chown -R www-data:www-data /var/www/html

# this will launch nginx in the foreground so that the container doesn't stop
CMD [ "nginx", "-g", "daemon off;" ]


# req: openssl command to generate a certificate request
# -x509: outputs a self-signed certificate instead of a certificate request
# -nodes: no password will be set for the private key
# -out: the file to write the certificate to
# -keyout: the file to write the private key to
# -subj: the subject of the certificate