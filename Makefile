RED = \033[0;31m
GREEN = \033[0;32m
CYAN = \033[0;36m
RESET = \033[0m

NAME = Inception

VOL_WP = data/wordpress
VOL_DB = data/mariadb
DATA_DIR = data

COMPOSE = ./srcs/compose.yaml

all: $(NAME)

$(NAME): $(VOL_WP) | $(VOL_DB)
	@grep jbagger.42.fr /etc/hosts > /dev/null || echo "127.0.0.1	jbagger.42.fr" | sudo tee -a /etc/hosts > /dev/null
	docker compose -f $(COMPOSE) up -d

$(DATA_DIR):
	mkdir -p $@

$(VOL_WP): $(DATA_DIR)
	mkdir -p $@

$(VOL_DB): $(DATA_DIR)
	mkdir -p $@

list:
	@echo "$(CYAN)List of docker images:$(RESET)"
	@docker images
	@echo "$(CYAN)List of docker containers:$(RESET)"
	@docker ps -a

clean:
	docker compose -f $(COMPOSE) down --rmi all -v

fclean: clean
	sudo sed -i '/jbagger\.42\.fr/d' /etc/hosts
	sudo rm -rf $(DATA_DIR)

re: fclean all

restart:
	docker compose -f $(COMPOSE) restart

prune:
	docker system prune -f