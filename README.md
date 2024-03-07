# OpenJDK-Hackathon Kompetensdag 2024-03-08

This readme is only meta-information about how to get the lab up and running. For information about the OpenJDK, refer to `./openjdk/README.md`.

## Prerequisites

The only strict requirement should be Docker. Building the OpenJDK is no small feat, requiring lots of variables and dependencies. To make this process (hopefully) simpler, a Dockerfile is provided which, when run with Docker, should set up an isolated environment with all requirements needed.

Building the JDK is a hardware-intensive process, meaning your laptop might run hot. A power adapter might be useful as well.

## Building the Docker image

To build the Docker image, all you should need to do is run the `make build`-command provided in the top-level `Makefile`. _Note that if you are on an M1/M2 Mac running the Apple Silicon-architecture, you must use `make buildm1`!_

## Running the Docker image

Once the Docker image has been built and the JDK has been compiled (as part of the build process), run `make run` to enter the Docker image interactively.

The executable java and javac will be located in openjdk/build/[architecture]/jdk/bin/.

To test out your home-made Java development kit, try compiling the provided main.java using
`./build/*/jdk/bin/javac ./main.java`
and then running it using
`./build/*/jdk/bin/java Main`

## Recompiling
When changing anything in your build, you'll need to recompile. If the change has been made inside the container, you can run `make images` from the root folder to compile the JDK using Oracle's make pipeline.
If you're coding outside the docker container, you need to re-build your docker image using the steps above. Note that the latter will re-compile the entire JDK, which on a OP Macbook Pro 2022 takes about 6 minutes. If you are only making a small change, consider modifying the library inside of the container using VIM or Emacs.
