#!/bin/bash

# Get the list of all container IDs
CONTAINER_IDS=$(docker ps -aq)

# Loop through each container ID and print it
for CONTAINER_ID in $CONTAINER_IDS
do
    docker rm $CONTAINER_ID
done