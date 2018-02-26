## Tomochain Testnet
This repository contains source code and tutorial to help you build a node to join Tomochain Testnet.

See Tomochain Introduction by Long Vuong: [https://www.slideshare.net/LongVuong2/tomochain-introduction](https://www.slideshare.net/LongVuong2/tomochain-introduction)

## Prerequisite
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

## Setup

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

Your node name (INSTANTCE_NAME) should be name of star.

Contact us to know the value of `WS_SECRET` in `.env` file.

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

## How to get free TOMO in testnet?
Input your addresst to the form: [https://faucet.tomocoin.io](http://faucet.tomocoin.io)

## How to use Metamask to connect Tomochain Testnet
See thi blog post: [https://medium.com/tomocoin/tomo-guideline-how-to-connect-metamask-wallet-to-tomochain-f25053361ef](https://medium.com/tomocoin/tomo-guideline-how-to-connect-metamask-wallet-to-tomochain-f25053361ef)

## Using Myetherwallet
Tomochain Testnet now is available on MyetherWallet
![Tomochain on MyEtherWallet](https://scontent.fhan5-3.fna.fbcdn.net/v/t1.0-9/26047000_10208314959310568_4609849091381238429_n.jpg?oh=31ab2499dfbb29fe26db595dbf28818a&oe=5B16E6BE)

## How to become a Validator?
Become Tomochain's Partnership
