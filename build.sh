#!/bin/bash

cp -r keys/certs staging/ethereum-authentication-server/config
cp -r keys/rsa_keys staging/ethereum-authentication-server/config
cp -r keys/certs staging/ethereum-sample-web/node-server/config
cp -r keys/rsa_keys staging/ethereum-sample-web/node-server/config
mkdir staging/ethereum-sample-web/node-server/config/certs
mv staging/ethereum-sample-web/node-server/config/server* staging/ethereum-sample-web/node-server/config/certs
docker build -t npm-dependencies ./staging/npm-dependencies
docker build -t go-ethereum ./staging/go-ethereum
docker-compose build
