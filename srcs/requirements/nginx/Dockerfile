FROM debian:buster

RUN apt update && apt install curl -y \
	nginx -y

COPY conf /etc/nginx/conf.d

EXPOSE 443/tcp
CMD ["usr/sbin/nginx", "-g", "daemon off;"] 

