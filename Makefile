COMPOSE_FILE = srcs/docker-compose.yml
DATA_PATH = /home/moel-hai/data

all: up

up:
	@mkdir -p $(DATA_PATH)/mariadb
	@mkdir -p $(DATA_PATH)/wordpress
	@docker compose -f $(COMPOSE_FILE) up -d --build

down:
	@docker compose -f $(COMPOSE_FILE) down

clean:
	@docker compose -f $(COMPOSE_FILE) down -v

fclean: clean
	docker compose -f $(COMPOSE_FILE) down --rmi all
	@sudo rm -rf $(DATA_PATH)

re: fclean all