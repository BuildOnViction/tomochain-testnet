FROM golang:stretch

ENV GETH_VERSION=1.7.3
WORKDIR /build

RUN \
    apt-get update && apt-get install -y git build-essential && \
    git clone --depth 1 -b v1.7.3 https://github.com/ethereum/go-ethereum && \
    (cd go-ethereum && make geth)

RUN cp go-ethereum/build/bin/geth /usr/bin && chmod +x /usr/bin/geth && \
    rm -rf go-ethereum

COPY ./genesis.json /build/genesis.json
COPY ./entrypoint.sh /build/entrypoint.sh
COPY ./healthcheck.sh /build/healthcheck.sh
COPY ./.bootnodes /build/.bootnodes
RUN chmod +x /build/entrypoint.sh
RUN chmod +x /build/healthcheck.sh

EXPOSE 8545
EXPOSE 30303

ENTRYPOINT ["/build/entrypoint.sh"]
