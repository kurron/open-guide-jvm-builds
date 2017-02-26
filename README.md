# Overview
This is a step-by-step guide on how to set up a build and deployment
of a JVM-based microservice that uses the following tech stack:

* Azul's OpenJDK
* Docker Engine
* Gradle
* Groovy
* Spring Boot
* Artifactory
* Spock
* Cucumber

The goal is to create a multi-stage build that uses Docker to contain
and run each stage.  The only prerequisites on the build machine is a
compatible version of the Docker Engine.  Everything else is handled
in-container.  We're shooting for a system that works well in a CD
environment and can also be run locally on a developer's box for
troubleshooting.

# Prerequisites
* Ubuntu 16.04
* Docker Engine

# The Plan
We'll be using Gradle as our build tool as it is very convenient and
powerful.  Normally, you run `./gradlew build` and it performs all the
tasks at once.  Since we are breaking things up in stages, we'll be running
many of the tasks explicitly.  

## Docker Image
We'll need a small and carefully crafted Docker image to fuel our pipeline.
The requirements are pretty simple:
* a current OpenJDK implementation
* a non-root user

We run as a normal user to avoid potential security issues.

# Building
## Stage One: Compilation
In this stage all we want to do is see if the code compiles.  Before we can do
this, we need to construct the Docker image we'll be using to run our JVM taks.
Run `bin/build-base-container.sh` and you should see something similar this:

```bash
Sending build context to Docker daemon 25.04 MB
Step 1/7 : FROM azul/zulu-openjdk:latest
latest: Pulling from azul/zulu-openjdk
Digest: sha256:94be6b9921339481528a97c4244e43446b16f34407c96e34c4599bdc8ddc2040
Status: Image is up to date for azul/zulu-openjdk:latest
 ---> f1d8c59e7ce0
Step 2/7 : MAINTAINER Ron Kurr <kurr@jvmguy.com>
 ---> Using cache
 ---> 056f8b9d3afc
Step 3/7 : ENV JAVA_HOME /usr/lib/jvm/zulu-8-amd64
 ---> Using cache
 ---> 842e794119c2
Step 4/7 : ENV JDK_HOME /usr/lib/jvm/zulu-8-amd64
 ---> Using cache
 ---> 14caa19e9963
Step 5/7 : RUN groupadd --system microservice              --gid 1000 &&     useradd --uid 1000             --gid microservice             --home-dir /home/microservice             --create-home             --shell /bin/bash             --comment "Docker image user" microservice &&     chown -R microservice:microservice /home/microservice
 ---> Using cache
 ---> 54e28c991f2b
Step 6/7 : WORKDIR /home/microservice
 ---> Using cache
 ---> 2e859ada1bdc
Step 7/7 : USER microservice
 ---> Using cache
 ---> b04ac5d88597
Successfully built b04ac5d88597
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
pipeline            latest              b04ac5d88597        4 minutes ago       354 MB
openjdk version "1.8.0_121"
OpenJDK Runtime Environment (Zulu 8.20.0.5-linux64) (build 1.8.0_121-b15)
OpenJDK 64-Bit Server VM (Zulu 8.20.0.5-linux64) (build 25.121-b15, mixed mode)
```

You can [peruse the Dockerfile](pipeline/dockerfile-base), if you are interested
in the details.

Now that we have an image to work with, we need teach it how to compile the code.
This done by using Docker's volume support.  We'll be mounting our source into
the container in read-only mode as well as mounting a volume container to hold
the results of build.  Why use a volume container?  We need a common spot that
each stage can reference as the pipeline progress and that is the simplest
solution.

We now need to build the data container by running `bin/build-data-container.sh`.
This will create a container the creates a data volume and then immediately exits.

# Installation
# Tips and Tricks
# Troubleshooting
# License and Credits
This project is licensed under the [Apache License Version 2.0, January 2004](http://www.apache.org/licenses/).
