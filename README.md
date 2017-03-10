# Auth0 remote Ethereum authentication project deployment

The purpose of this project is to hold the Docker configuration required
to deploy the entire Auth0 project with few commands easily.

## Main project deployment

First, clone the project. The cd into it. Then run the following command

```bash
./clone.sh
```

This script will checkout all the required projects to the 'staging'
directory. It may prompt your for your password.

```bash
./build.sh
```

This script will build the npm dependencies docker image along with all the other defined
in docker-compose.yml. It will take some time.

Replace the FIREBASE-API-KEY placeholder in the docker-compose.yml with your firebase api-key.
Replace the AUTH-SERVER-URL with the URL of the authentication server (localhost should work when testing the webpage locally), ex. https://localhost:3000/

```bash
./start.sh
```

NOTE: if your are running this locally the mobile app might not be able to connect with the authentication server (it downloads the full url from firebase database, you might be able to somehow pull this off in the emulator)

All the services should we accesible via localhost/docker ip.

Go to https://localhost:3000/information and accept the self-signed certificate. Also click the  Initialize server button and wait for all the fields to fill.

After that you have to stop the mining process, which causes transaction forking. To do so run the stopMiner.sh and pass the IP (localhost should work locally) of the go-ethereum docker container. (If you are running it on the GCP use the stopMining.sh in the kubernetes directory)

You can access the sample web via http://localhost:3001/authzero

WINDOWS users: You have to turn on port forwarding in your virtualbox Default docker VM, so that they can be mapped to localhost.

## Integration tests

Docker compose is also used for integration testing.

### Registration service

```bash
cd registry-service-integration-tests
docker-compose.exe build
docker-compsoe.exe up
```