#!/bin/bash

docker build --file pipeline/dockerfile-data --pull --rm --tag pipeline-data:latest .
docker images pipeline

# create the container, which immedialy exits but retains its volume
docker run --name pipeline-data --user 1000:1000 --network none pipeline-data:latest

# prove the container exits
docker ps -a --filter 'name=pipeline-data'
