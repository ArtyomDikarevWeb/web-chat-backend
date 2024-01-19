DOCKER_COMPOSE = docker compose -f docker-compose.yaml

all:
	@echo "Docker: "
	@echo " - make up"
	@echo " - make run"
	@echo "Composer: "
	@echo " - make composer/install"

composer/install:
	docker compose run composer install

composer/update:
	docker compose run composer update

up: build run composer/install

build:
	${DOCKER_COMPOSE} build

run:
	${DOCKER_COMPOSE} up -d

down:
	${DOCKER_COMPOSE} down

exec/app_bash:
	docker exec -it web-chat-backend-php-1 /bin/bash