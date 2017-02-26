#!/bin/bash

# create the container, which immedialy exits but retains its volume
docker run --name pipeline-data --network none --volume /pipeline busybox:latest

# prove the container exits
docker ps -a --filter 'name=pipeline-data'
