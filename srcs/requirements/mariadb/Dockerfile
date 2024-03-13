FROM debian:buster

RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/createDatabase.sh /
WORKDIR /
RUN chmod +x ./createDatabase.sh

RUN echo "Testing!"

CMD ["/createDatabase.sh"]