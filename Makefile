.PHONY: all
all: up

.PHONY: up
up:
	# mkdir -p /home/alefranc/data/wordpress
	mkdir -p /home/alefranc/data/mysql
	cd srcs/ && docker compose up -d

.PHONY: down
down:
	cd srcs/ && docker compose down

.PHONY: build
build:
	cd srcs/ && docker compose build

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
	sudo rm -rf /home/alefranc/data/mysql/*

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
	cd srcs/ && docker compose exec nginx /bin/sh

.PHONY: wordpress
wordpress:
	cd srcs/ && docker compose exec wordpress /bin/sh

.PHONY: mariadb
mariadb:
	cd srcs/ && docker compose exec mariadb /bin/sh
