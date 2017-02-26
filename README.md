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

# Building
## Stage One: Compilation
In this stage all we want to do is see if the code compiles.

# Installation
# Tips and Tricks
# Troubleshooting
# License and Credits
This project is licensed under the [Apache License Version 2.0, January 2004](http://www.apache.org/licenses/).
