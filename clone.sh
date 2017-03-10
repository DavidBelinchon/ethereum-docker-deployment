#!/bin/bash

git config --global credential.helper cache

function clone {
	REPO_NAME=$1
	git clone "https://github.com/auth0/$REPO_NAME.git"
}

cd staging

mkdir npm-dependencies
cd npm-dependencies

clone ethereum-auth-client
clone ethereum-crypto
clone ethereum-user-db-service

cp ../../npm-dependencies/Dockerfile Dockerfile

cd ..

clone ethereum-authentication-server
clone ethereum-sample-web
clone ethereum-user-db-docker
clone go-ethereum