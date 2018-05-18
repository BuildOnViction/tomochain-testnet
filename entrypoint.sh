#!/bin/bash

if [ ! -d /build/tomochain/tomo/chaindata ]
then
  wallet=$(tomo account new --password /build/.pwd --datadir /build/tomochain | awk -v FS="({|})" '{print $2}')
  if [[ -v FIRST_NODE ]]
  then
      echo Generate genesis block for wallet $wallet ...
      sed "s/:wallet:/${wallet}/g" /build/tomochain.json > /build/genesis.json
  fi
  tomo --datadir /build/tomochain init /build/genesis.json
else
  wallet=$(tomo account list --datadir /build/tomochain| head -n 1 | awk -v FS="({|})" '{print $2}')
fi

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

if [[ -v FIRST_NODE ]]; then
    echo Starting the first node ...
    tomo --datadir /build/tomochain --networkid 89 --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --rpcport 8545 --rpcvhosts "*" --unlock "${wallet}" --password /build/.pwd --mine --gasprice "1" --targetgaslimit "420000000"
else
    echo Starting nodes with bootnodes $bootnodes ...
    tomo --bootnodes ${bootnodes} --datadir /build/tomochain --networkid 89 --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --rpcport 8545 --rpcvhosts "*" --unlock "${wallet}" --password /build/.pwd --mine --gasprice "1" --targetgaslimit "420000000"
fi
