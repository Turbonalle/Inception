## create a network called mongo-network
docker network create mongo-network

## list all networks
docker network ls

## run a mongo container
# run in detached mode (in the background)
# expose the port 27017 on the host machine
# set the environment variables
# specify the network
# set the name of the container
# specify the image to use
docker run -d \
-p 27017:27017 \
-e MONGO_INITDB_ROOT_USERNAME=admin \
-e MONGO_INITDB_ROOT_PASSWORD=supersecret \
--network mongo-network \
--name mongodb \
mongo

## list all running containers
docker ps

## run mongo-express
docker run -d \
-p 8081:8081 \
-e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
-e ME_CONFIG_MONGODB_ADMINPASSWORD=supersecret \
-e ME_CONFIG_MONGODB_SERVER=mongodb \
--network mongo-network \
--name mongo-express \
mongo-express

## list all running containers
docker ps

## test the connection
# open a browser and go to http://localhost:8081 (will ask for authentication)
# check for credentials in the terminal
docker logs <mongo-express-container-id>
# write username and password

## stop the containers
docker stop mongodb mongo-express

## remove the containers
docker rm mongodb mongo-express

## remove the network
docker network rm mongo-network

## run the containers using docker-compose
docker-compose -f mongo-services.yaml up -d

## stop containers but don't remove them
docker-compose -f mongo-services.yaml stop

## restart the containers
docker-compose -f mongo-services.yaml start

## stop and remove the containers and network
docker-compose -f mongo-services.yaml down

## list containers
docker ps -a

