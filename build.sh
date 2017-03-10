#!/bin/bash

cp -r keys/certs staging/ethereum-authentication-server/config
cp -r keys/rsa_keys staging/ethereum-authentication-server/config

docker.exe build -t npm-dependencies ./staging/npm-dependencies
docker-compose.exe build
