RED = \033[0;31m
GREEN = \033[0;32m
CYAN = \033[0;36m
RESET = \033[0m
VOL_WP = data/wordpress
VOL_DB = data/mariadb

vol:
	@mkdir -p $(VOL_WP) $(VOL_DB)
	@[ -e $(VOL_WP)/index.php ] || echo '<!DOCTYPE html><html><head><title>PHP Test</title></head><body><?php echo "<p>Hello World</p>"; ?></body></html>' > $(VOL_WP)/index.php

up: vol
	@echo "$(CYAN)Composing$(RESET)"
	@docker compose -f ./srcs/compose.yaml up -d

down:
	@echo "$(CYAN)Decomposing$(RESET)"
	@docker compose -f ./srcs/compose.yaml down

build: vol
	@echo "$(CYAN)Building$(RESET)"
	@docker compose -f ./srcs/compose.yaml up -d --build

list:
	@echo "$(CYAN)List of docker images:$(RESET)"
	@docker images
	@echo "$(CYAN)List of docker containers:$(RESET)"
	@docker ps -a

godb:
	@echo "$(CYAN)Entering mariadb$(RESET)"
	docker exec -it mariadb sh

gowp:
	@echo "$(CYAN)Entering wordpress$(RESET)"
	docker exec -it wordpress sh

gong:
	@echo "$(CYAN)Entering nginx$(RESET)"
	docker exec -it nginx sh

clean: down
	@echo "$(CYAN)Removing containers:$(RESET)"
	@./tools/remove_containers.sh

fclean: clean
	@echo "$(CYAN)Removing images:$(RESET)"
	@./tools/remove_images.sh

vclean: fclean
	@echo "$(CYAN)Removing volumes:$(RESET)"
	@if [ -d $(VOL_WP) ]; then \
		sudo rm -rf $(VOL_WP); \
		echo "$(VOL_WP)"; \
	fi
	@if [ -d $(VOL_DB) ]; then \
		sudo rm -rf $(VOL_DB); \
		echo "$(VOL_DB)"; \
	fi
	@if [ -d data ]; then \
		sudo rm -rf data; \
		echo "data"; \
	fi

prune: vclean
	@echo "$(CYAN)Pruning docker system$(RESET)"
	@docker system prune -fa --volumes

re: fclean build

vre: vclean build