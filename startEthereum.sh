#!/bin/bash

docker run -p 8545:8545 --name go-ethereum go-ethereum /bin/bash /start.sh &
