#!/bin/bash

docker kill submit cm execute
docker container prune -f
rm -f scheddsecrets/token submitsecrets/token secrets/token
