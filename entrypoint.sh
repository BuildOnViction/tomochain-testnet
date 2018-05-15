#!/bin/bash

if [ ! -d /build/tomochain/tomo/chaindata ]
then
  wallet=$(tomo account new --password /build/.pwd --datadir /build/tomochain | awk -v FS="({|})" '{print $2}')
  sed "s/:wallet:/${wallet}/g" /build/tomochain.json > /build/genesis.json
  tomo --datadir /build/tomochain init /build/genesis.json
else
  wallet=$(tomo account list --datadir /build/tomochain| head -n 1 | awk -v FS="({|})" '{print $2}')
fi
tomo --datadir /build/tomochain --networkid 89 --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --rpcport 8545 --unlock "${wallet}" --password /build/.pwd --mine --gasprice "100000000" --targetgaslimit "42000000"
