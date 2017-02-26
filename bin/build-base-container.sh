#!/bin/bash

docker build --file pipeline/dockerfile-base --pull --rm --tag pipeline:latest .
docker images pipeline
docker run --rm --tty --interactive pipeline:latest java -version
