#!/bin/bash

cp -r keys/certs staging/ethereum-authentication-server/config
cp -r keys/rsa_keys staging/ethereum-authentication-server/config
cp -r keys/certs staging/ethereum-sample-web/node-server/config
cp -r keys/rsa_keys staging/ethereum-sample-web/node-server/config

docker build -t npm-dependencies ./staging/npm-dependencies
docker build -t go-ethereum ./staging/go-ethereum
docker-compose build
