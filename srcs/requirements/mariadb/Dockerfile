FROM debian:buster

EXPOSE 3306

RUN apt update && apt upgrade -y && apt install execline -y \ 
	&& apt install mariadb-server -y \
	&& mkdir -p /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql \
	&& chmod 777 /run/mysqld 

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
 
COPY conf/docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["mysqld"]









