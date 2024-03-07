RED = \033[0;31m
GREEN = \033[0;32m
CYAN = \033[0;36m
RESET = \033[0m

# compose:

build:
	@echo "$(CYAN)Building Nginx$(RESET)"
	@docker build -t my-nginx-image .

run:
	@echo "$(CYAN)Running Nginx$(RESET)"
	@docker run -p 443:443 my-nginx-image

list:
	@echo "$(CYAN)List of docker images:$(RESET)"
	@docker images
	@echo "$(CYAN)List of docker containers:$(RESET)"
	@docker ps -a

stop:
	@echo "$(CYAN)Stopping Nginx$(RESET)"
	@docker stop $(docker ps -a -q)

clean:
	@echo "$(CYAN)Removing containers:$(RESET)"
	@./remove_containers.sh

fclean: clean
	@echo "$(CYAN)Removing images:$(RESET)"
	@./remove_images.sh

re: fclean build run

# docker stop $(docker ps -a -q)   # Stops all containers
# docker rm $(docker ps -a -q)     # Removes all stopped containers