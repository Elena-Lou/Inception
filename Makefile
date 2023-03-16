DOCKER_COMPOSE=./srcs/docker-compose.yml

all: up

up:
	@sudo mkdir -p /home/elouisia/data/wordpress
	@sudo mkdir -p /home/elouisia/data/mariadb
	@docker compose -f $(DOCKER_COMPOSE) up -d --build

debug: 
	@sudo mkdir -p /home/elouisia/data/wordpress
	@echo "\n \n --- /data/wordpress created --- \n \n"
	@sudo mkdir -p /home/elouisia/data/mariadb
	@echo "\n \n --- /data/mariadb created --- \n \n"
	@docker compose -f $(DOCKER_COMPOSE) --verbose up 

clean:
	@cd srcs && docker compose down
	@docker system prune --volumes -a -f
	@sudo rm -rf /home/elouisia/data/*
	@docker volume rm srcs_mariadb srcs_wordpress

.PHONY: run debug clean
