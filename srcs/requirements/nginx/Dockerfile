FROM debian:buster

RUN apt update && apt install nginx curl -y  \
	&& mkdir -p /etc/ssl \
	&& apt install openssl -y \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/elouisia.42.fr.key -out /etc/ssl/certs/elouisia.42.fr.crt -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42 Paris/CN=elouisia.42.fr"

COPY conf /etc/nginx/sites-available/default

CMD ["usr/sbin/nginx", "-g", "daemon off;"] 

