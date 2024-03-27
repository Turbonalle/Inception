FROM debian:bullseye

# Install MariaDB
RUN apt-get update && \
	apt-get install -y \
	sudo \
	mariadb-server \
	mariadb-client && \
	rm -rf /var/lib/apt/lists/*

# Copy configuration file
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Change permissions of configuration file
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy database initialization script
COPY ./tools/initdb.sh bin/docker-entrypoint-initdb.sh

RUN chmod +x bin/docker-entrypoint-initdb.sh

ENTRYPOINT ["bin/docker-entrypoint-initdb.sh"]
# ENTRYPOINT ["sleep", "10000"]