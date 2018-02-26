#!/bin/bash

input="/build/.bootnodes"
bootnodes=""
while IFS= read -r line
do
  if [ -z "${bootnodes}" ]
  then
    bootnodes=$line
  else
    bootnodes="${bootnodes},$line"
  fi
done < "$input"
echo $bootnodes

if [ ! -d /build/vet/geth/chaindata ]
then
  wallet=$(geth account new --password /build/.pwd --datadir /build/vet | awk -v FS="({|})" '{print $2}')
  geth --datadir /build/vet init /build/genesis.json
  geth --bootnodes ${bootnodes} --datadir /build/vet --networkid 40686 --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --rpcport 8545 --unlock "${wallet}" --password /build/.pwd --mine --gasprice "100000000" --targetgaslimit "42000000"
else
  wallet=$(geth account list --datadir /build/vet| head -n 1 | awk -v FS="({|})" '{print $2}')
  geth --bootnodes ${bootnodes} --datadir /build/vet --networkid 40686 --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --rpcport 8545 --unlock "${wallet}" --password /build/.pwd --mine --gasprice "100000000" --targetgaslimit "42000000"
fi
