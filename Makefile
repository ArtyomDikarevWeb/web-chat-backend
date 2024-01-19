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