#!/bin/bash

# run a container that runs the first stage of the pipeline
CMD="docker run --rm \
                --env LANGUAGE=en_US \
                --env BUILD_DIR=/code/build \
                --hostname gradle \
                --interactive \
                --name gradle \
                --net host \
                --tty \
                --volume $(pwd):/code:ro \
                --volumes-from pipeline-data:rw \
                --workdir /code \
                pipeline:latest \
                ./gradlew  \
                --project-prop branch=master \
                --project-prop major=0 \
                --project-prop minor=0 \
                --project-prop patch=$(date +%s) \
                --project-prop buildDir=/pipeline/build \
                --console=plain \
                --gradle-user-home=/home/microservice \
                --no-daemon \
                --no-search-upward \
                --project-cache-dir=/pipeline/cache \
                --project-dir=/code \
                --stacktrace \
                compileGroovy compileTestGroovy"

echo ${CMD}
${CMD}
