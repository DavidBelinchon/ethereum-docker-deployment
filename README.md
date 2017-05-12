# Auth0 remote Ethereum authentication project deployment

The purpose of this project is to hold the Docker configuration required
to deploy the entire Auth0 project with few commands easily.

## Main project deployment

First, clone the project. The cd into it. Then run the following command

```bash
./clone.sh
```

Put the private keys and certificcates in the keys directory
- keys/certs/server.crt
- keys/certs/server.csr
- keys/certs/server.key
- keys/rsa_keys/id_rsa
- keys/rsa_keys/id_rsa.pub

This script will checkout all the required projects to the 'staging'
directory. It may prompt your for your password.

```bash
./build.sh
```

This script will build the npm dependencies docker image along with all the other defined
in docker-compose.yml. It will take some time.

Mapper contract
Use version compiled on the testnet (Ropsten) with address → 0xf01f9d549b92e61079caad748471b0864e88e30f 

Compile your own contract:
Go to https://ethereum.github.io/browser-solidity/
Copy the contracts
click to create button to both contracts
wait to have the address

Replace the following placeholders in docker-compose.yml:

- MANDRILL-KEY
- MANDRILL-EMAIL-TO will be used in the "from" field of emails sent to the user
- CONTRACT-ADDRESS with the mapper contract address. ex: 0xf01f9d549b92e61079caad748471b0864e88e30f
- FIREBASE-API-KEY placeholder in the docker-compose.yml with your firebase api-key.
- AUTH-SERVER-URL with the URL of the authentication server ex  https://52.59.22.11:3000/, it will be used by the frontend
to send request to the authentication server
- JWT-TIMEOUT is the JWT expiration time in seconds

Run the following script to boot an ethereum testnet node:

```bash
./startEthereum.sh
```

Wait till it syncs up with the testnet, so wait till you see this message: "Fast sync complete, auto disabling"

If you already have a synchronized ethereum container rename it to 'go-ethereum' and open the port 8545

Run the following script to boot everything else:

```bash
./start.sh
```

After everything starts properly run the script:

```bash
./initialize.sh
```

You are set!

Frontend will be available at url http://ip:3001/authzero
Wallet will be available at url http://ip:3002/wallet

Remember to change the server ip in the firebase console before using the mobile app!
