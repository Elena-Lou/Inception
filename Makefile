DOCKER_COMPOSE=./srcs/docker-compose.yml

all: up

up:
	@sudo mkdir -p /home/elouisia/data/wordpress
	@sudo mkdir -p /home/elouisia/data/mariadb
	@docker compose -f $(DOCKER_COMPOSE) up -d --build

stop:
	@docker compose -f $(DOCKER_COMPOSE) stop

down:
	@docker compose -f $(DOCKER_COMPOSE) down

clean:
	@docker compose -f $(DOCKER_COMPOSE) down
	@docker system prune --volumes -a -f
	@docker volume prune -f
	@sudo rm -rf /home/elouisia/data/*

re: clean up

mariadb_logs:
	@docker compose -f $(DOCKER_COMPOSE) logs mariadb

nginx_logs:
	@docker compose -f $(DOCKER_COMPOSE) logs nginx

wordpress_logs:
	@docker compose -f $(DOCKER_COMPOSE) logs wordpress

exec_mariadb:
	@docker compose -f $(DOCKER_COMPOSE) exec mariadb bash

exec_wordpress:
	@docker compose -f $(DOCKER_COMPOSE) exec wordpress bash

.PHONY: all up run stop down clean mariadb_logs nginx_logs wordpress_logs re exec_mariadb exec_wordpress
