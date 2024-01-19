DOCKER_COMPOSE = docker compose -f docker-compose.yaml

all:
	@echo "Docker: "
	@echo " - make up "
	@echo " - make run"
	@echo "Composer: "
	@echo " - make composer/install"
	@echo " - make composer/update"
	@echo " - make composer/require"
	@echo " - make composer/require-dev"

composer/install:
	docker compose run composer install

composer/update:
	docker compose run composer update

composer/require:
	docker compose run composer require

composer/require-dev:
	docker compose run composer require --dev

run: build up composer/install

build:
	${DOCKER_COMPOSE} build

up:
	${DOCKER_COMPOSE} up -d

down:
	${DOCKER_COMPOSE} down

exec/app_bash:
	docker exec -it web-chat-backend-php-1 /bin/bash