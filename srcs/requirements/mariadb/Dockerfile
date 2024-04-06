FROM debian:buster

EXPOSE 3306

RUN apt update \ 
	&& apt install mariadb-server -y \
	&& mkdir -p /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql \
	&& chmod 777 /run/mysqld 

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./health-check.sh /bin/health-check.sh

RUN chmod +x /bin/health-check.sh
 
COPY conf/mariadb-setup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/mariadb-setup.sh

ENTRYPOINT ["/usr/local/bin/mariadb-setup.sh"]

CMD ["mysqld"]









