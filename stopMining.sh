#!/bin/bash
GETH_IP=$1
DATA='{"jsonrpc":"2.0","method":"miner_stop","params":[],"id":2}'
curl -X POST --data $DATA $GETH_IP:8545