RED = \033[0;31m
GREEN = \033[0;32m
CYAN = \033[0;36m
RESET = \033[0m

compose:
	@echo "$(CYAN)Running Nginx with Docker Compose$(RESET)"
	@docker-compose -f ./srcs/docker-compose.yml up --build

build:
	@echo "$(CYAN)Building Nginx$(RESET)"
	@docker build -t nginx ./srcs/requirements/nginx

run:
	@echo "$(CYAN)Running Nginx$(RESET)"
	@docker run -it -p 443:443 nginx

list:
	@echo "$(CYAN)List of docker images:$(RESET)"
	@docker images
	@echo "$(CYAN)List of docker containers:$(RESET)"
	@docker ps -a
	@echo "$(CYAN)List of docker volumes:$(RESET)"
	@docker volume ls
	@echo "$(CYAN)List of docker networks:$(RESET)"
	@docker network ls

stop:
	@echo "$(CYAN)Stopping Nginx$(RESET)"
	@docker stop $(docker ps -a -q)

clean:
	@echo "$(CYAN)Removing containers:$(RESET)"
	@./_Study/Test/remove_containers.sh

fclean: clean
	@echo "$(CYAN)Removing images:$(RESET)"
	@./_Study/Test/remove_images.sh
	@echo "$(CYAN)Removing volumes:$(RESET)"
	@./_Study/Test/remove_volumes.sh
	@echo "$(CYAN)Removing networks:$(RESET)"
	@./_Study/Test/remove_networks.sh

re: fclean build run

# docker stop $(docker ps -a -q)   # Stops all containers
# docker rm $(docker ps -a -q)     # Removes all stopped containers