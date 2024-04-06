FROM debian:buster

EXPOSE 9000

RUN apt-get update && apt-get -y install \
	mariadb-client \
	curl \
	php7.3 \
	php-fpm \
	php-mysql \
	php-cgi \
	php7.3-cli \
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar 

RUN mv wp-cli.phar /usr/local/bin/

RUN mkdir /run/php

COPY ./conf/wordpress-setup.sh /usr/local/bin/

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

RUN chmod +x /usr/local/bin/wordpress-setup.sh

ENTRYPOINT ["/usr/local/bin/wordpress-setup.sh"]

CMD ["/usr/sbin/php-fpm7.3", "-F"]
