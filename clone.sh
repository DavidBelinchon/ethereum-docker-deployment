#!/bin/bash

git config --global credential.helper cache

function clone {
	REPO_NAME=$1
	git clone "https://github.com/auth0/$REPO_NAME.git"
}

function cloneTestnet {
	REPO_NAME=$1
	git clone -b testnet "https://github.com/auth0/$REPO_NAME.git"
}

cd staging

mkdir npm-dependencies
cd npm-dependencies

cloneTestnet ethereum-auth-client
clone ethereum-crypto
clone ethereum-user-db-service

cp ../../npm-dependencies/Dockerfile Dockerfile

cd ..

cloneTestnet ethereum-authentication-server
clone ethereum-sample-web
clone ethereum-user-db-docker