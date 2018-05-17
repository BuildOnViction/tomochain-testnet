#!/bin/bash

docker-compose -f docker-stack.yml rm -v -f -s tomochain && docker volume rm tomochain
