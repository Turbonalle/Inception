#!/bin/bash

# Get the list of all network IDs
NETWORK_IDS=$(docker network ls -q)

# Loop through each network ID and print it
for NETWORK_ID in $NETWORK_IDS
do
	docker network rm $NETWORK_ID
done