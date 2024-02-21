FROM debian:buster

RUN apt update

# -y flag is used to skip the confirmation prompt (telling it yes to everything)
RUN apt install nginx -y

# create a directory to store the SSL certificate and key
RUN mkdir -p /etc/nginx/ssl

RUN apt install OpenSSL -y

opessl req