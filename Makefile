COMPOSE_FILE = srcs/docker-compose.yml

.PHONY: all
all: up

.PHONY: up
up:
	docker compose -f ${COMPOSE_FILE} up -d

.PHONY: down
down:
	docker compose -f ${COMPOSE_FILE} down

.PHONY: build
build:
	docker compose -f ${COMPOSE_FILE} build

.PHONY: clean
clean: down
	docker image rm --force inception-nginx inception-wordpress inception-mariadb

.PHONY: fclean
fclean: down
	docker container 	prune --force
	docker image		prune --all --force
	docker network		prune --force
	docker volume		prune --force

.PHONY: cleandb
cleandb:
	sudo rm -rf /home/alefranc/data/*

.PHONY: info
info:
	@docker image		ls -a	&& echo
	@docker container	ls -a	&& echo
	@docker network		ls		&& echo
	@docker volume		ls		&& echo

.PHONY: re
re: fclean all

.PHONY: nginx
nginx:
	docker compose -f ${COMPOSE_FILE} exec nginx /bin/sh

.PHONY: wordpress
wordpress:
	docker compose -f ${COMPOSE_FILE} exec wordpress /bin/sh

.PHONY: mariadb
mariadb:
	docker compose -f ${COMPOSE_FILE} exec mariadb /bin/sh
