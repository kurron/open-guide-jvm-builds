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

# Building
## Stage One
In this stage we want to run the basic steps needed to create a
viable artifact worth promoting to the next stage.  This means:
* see if the code compiles
* see if it passes automated inspection
* see if it passes automated unit-level tests
* assemble the passing bits into an artifact 

# Installation
# Tips and Tricks
# Troubleshooting
# License and Credits
This project is licensed under the [Apache License Version 2.0, January 2004](http://www.apache.org/licenses/).
