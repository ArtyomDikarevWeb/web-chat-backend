FROM composer:latest

WORKDIR /var/www/web-chat-backend

ENTRYPOINT ["composer", "--ignore-platform-reqs"]
