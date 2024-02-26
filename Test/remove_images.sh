#!/bin/bash

# Get the list of all image IDs
IMAGE_IDS=$(docker images -q)

# Loop through each image ID and print it
for IMAGE_ID in $IMAGE_IDS
do
    docker rmi $IMAGE_ID
done