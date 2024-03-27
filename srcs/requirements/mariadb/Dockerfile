FROM debian:bullseye

RUN apt-get update && \
	apt-get install -y \
	sudo \
	mariadb-server \
	mariadb-client && \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/initdb.sh bin/docker-entrypoint-initdb.sh
RUN chmod +x bin/docker-entrypoint-initdb.sh

ENTRYPOINT ["bin/docker-entrypoint-initdb.sh"]