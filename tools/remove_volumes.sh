#!/bin/bash

# Get the list of all volume IDs
VOLUME_IDS=$(docker volume ls -q)

# Loop through each volume ID and print it
for VOLUME_ID in $VOLUME_IDS
do
	docker volume rm $VOLUME_ID
done