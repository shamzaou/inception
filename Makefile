all: up

up:
	docker-compose -f srcs/docker-compose.yml up -d --build

down:
	docker-compose -f srcs/docker-compose.yml down

clean: down
	docker system prune -a

fclean: clean
	docker volume rm $$(docker volume ls -q)

re: fclean all

ps:
	docker-compose -f srcs/docker-compose.yml ps

logs:
	docker-compose -f srcs/docker-compose.yml logs

nginx-test:
	docker-compose -f srcs/docker-compose.yml exec nginx nginx -t

wp-test:
	docker-compose -f srcs/docker-compose.yml exec wordpress wp core is-installed --allow-root --path=/var/www/html

db-test:
	docker-compose -f srcs/docker-compose.yml exec mariadb mysqladmin -u root -p$${MYSQL_ROOT_PASSWORD} ping

init-wp:
	docker-compose -f srcs/docker-compose.yml exec wordpress wp core install --path=/var/www/html --url=https://localhost --title="WordPress Site" --admin_user=$${WORDPRESS_ADMIN_USER} --admin_password=$${WORDPRESS_ADMIN_PASSWORD} --admin_email=$${WORDPRESS_ADMIN_EMAIL} --allow-root

check-wp:
	docker-compose -f srcs/docker-compose.yml exec wordpress ls -la /var/www/html
	docker-compose -f srcs/docker-compose.yml exec wordpress cat /var/www/html/wp-config.php

test: ps logs nginx-test wp-test db-test

.PHONY: all up down clean fclean re ps logs nginx-test wp-test db-test init-wp check-wp test