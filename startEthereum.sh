#!/bin/bash

docker run -p 8545:8545 --name go-ethereum go-ethereum /bin/bash /start.sh &

echo "Waiting for the node to go up, please wait..."
sleep 120

curl -X POST -d @node1 localhost:8545
curl -X POST -d @node2 localhost:8545
