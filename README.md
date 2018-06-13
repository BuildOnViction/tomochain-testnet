## TomoChain Testnet
This repository contains source code and tutorial to help you:
- Deploy Smart Contract to TomoChain Testnet
- Run a node to join TomoChain Testnet
- Run your TomoChain Private Network

TomoChain Technical Paper 1.0: [https://tomochain.com/docs/technical-whitepaper--1.0.pdf](https://tomochain.com/docs/technical-whitepaper--1.0.pdf)
TomoChain Testnet Block Explorer (TomoScan): [https://explorer-testnet.tomochain.com](https://explorer-testnet.tomochain.com)

## Deploy Smart Contract to TomoChain Testnet
### How to get free TOMO in testnet?
Input your addresst to the form: [https://faucet.tomochain.com](http://faucet.tomochain.com)

### How to use Metamask to connect TomoChain Testnet
See thi blog post: [https://medium.com/tomocoin/tomo-guideline-how-to-connect-metamask-wallet-to-tomochain-f25053361ef](https://medium.com/tomocoin/tomo-guideline-how-to-connect-metamask-wallet-to-tomochain-f25053361ef)

### Setup Truffle Framework
Truffle Framework is a great tool for developing DApps. You can use Truffle to deploy your contracts to TomoChain Testnet. The below is your suggestion for `truffle.js` config file.

```
'use strict'
const HDWalletProvider = require('truffle-hdwallet-provider')

module.exports = {
    networks: {
        tomo: {
            provider: function () {
                return new HDWalletProvider(process.env.MNEMONIC, 'https://testnet.tomochain.com')
            },
            network_id: 89,
            gasPrice: 1 // 1 wei
        }
    }
}

```

So now, you can deploy your smart contract with command:
```
MNEMONIC="FILL_CORRECT_MNEMONIC_WALLET" truffle deploy --reset --network tomo
```

## Run a node to join TomoChain Testnet
### Prerequisite
- Docker
- Docker Compose
- Git

Install Docker:
```
curl -sSL https://get.docker.com/ | sh
```
Install Docker Compose:
```
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

### Setup

Clone this source code:
```
git clone https://github.com/TOMOCOIN/tomochain-testnet.git
```

Enter `tomochain-testnet` directory, Create `.pwd` file
```
cd tomochain-testnet && touch .pwd
```

Edit `.pwd` file and input the password for your ethereum address if you want.

Create `.env` file by using the sample - `.env.example` file.

Your node name (INSTANTCE_NAME) should be name of stars.

`WS_SECRET=W7a4b0Ydi9cxp1z5baOgh13Yp66STl` in `.env` file.

CONTACT_DETAILS should be your name or company name.

To access Docker sockets, make sure you are added to the group `docker`:

```
sudo usermod -a -G docker $USER
```

Remember to log out and login again for this to take effect.

Finally, just run:
```
docker-compose -f docker-stack.yml up -d
```

### Notes

If you forgot to add yourself to the group `docker` and/or logout, you will see similar error:

```
$ docker-compose -f docker-stack.yml up -d
ERROR: Couldn't connect to Docker daemon at http+docker://localunixsocket - is it running?

If it's at a non-standard location, specify the URL with the DOCKER_HOST environment variable.
```

Finally, you will see your node at this page: [https://stats-testnet.tomochain.com](https://stats-testnet.tomochain.com)

## Run your TomoChain Private Network
In case you need build your private network, you just need to add a line to `.env` file:
```
FIRST_NODE=1
```
And run the command below:
```
docker-compose -f docker-stack.private.yml up -d
```
