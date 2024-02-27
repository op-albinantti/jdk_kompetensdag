# OpenJDK-Hackathon Kompetensdag 2024-03-08

This readme is only meta-information about how to get the lab up and running. For information about the OpenJDK, refer to `./openjdk/README.md`.

## Prerequisites
The only strict requirement should be Docker. Building the OpenJDK is no small feat, requiring lots of variables and dependencies. To make this process (hopefully) simpler, a Dockerfile is provided which, when run with Docker, should set up an isolated environment with all requirements needed.

Building the JDK is a hardware-intensive process, meaning your laptop might run hot. A power adapter might be useful as well.

## Building the Docker image
To build the Docker image, all you should need to do is run the `docker build`-command provided in the top-level `Makefile`. *Note that if you are on an M1/M2 Mac running the Apple Silicon-architecture, you must use `docker buildm1`!*

Once the Docker image has been built, run 
