FROM debian:buster

RUN apt-get update && apt-get -y install \
	curl \
	bash \
	php-fpm \
	php-mysql \
	php-cgi \
	php-curl \
	php-gd \
	php-intl \
	php-mbstring \
	php-soap \
	php-xml \
	php-xmlrpc \
	php-zip \
	pwgen -y \
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN mkdir /run/php

COPY ./conf/wordpress-setup.sh /usr/local/bin/

COPY ./conf/wp-config.php /var/www/

RUN chmod +x /usr/local/bin/wordpress-setup.sh

ENTRYPOINT ["/usr/local/bin/wordpress-setup.sh"]

WORKDIR /var/www/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
