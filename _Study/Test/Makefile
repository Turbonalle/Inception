RED = \033[0;31m
GREEN = \033[0;32m
CYAN = \033[0;36m
RESET = \033[0m

up:
	@echo "$(CYAN)Composing$(RESET)"
	@docker-compose up -d

down:
	@echo "$(CYAN)Decomposing$(RESET)"
	@docker-compose down

build:
	@echo "$(CYAN)Building Nginx$(RESET)"
	@docker build -t nginx .

run:
	@echo "$(CYAN)Running Nginx$(RESET)"
	@docker run -p 443:443 nginx

list:
	@echo "$(CYAN)List of docker images:$(RESET)"
	@docker images
	@echo "$(CYAN)List of docker containers:$(RESET)"
	@docker ps -a

stop:
	@echo "$(CYAN)Stopping containers$(RESET)"
	@docker stop $(docker ps -a -q)

clean: down
	@echo "$(CYAN)Removing containers:$(RESET)"
	@./remove_containers.sh

fclean: clean
	@echo "$(CYAN)Removing images:$(RESET)"
	@./remove_images.sh

re: down fclean build run

# docker stop $(docker ps -a -q)   # Stops all containers
# docker rm $(docker ps -a -q)     # Removes all stopped containers