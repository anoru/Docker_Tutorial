# Specify the base image you want to build on top of.
# Reference: https://hub.docker.com/_/ubuntu/
FROM ubuntu:16.04

# Adds metadata to the image as a key value pair example LABEL version="1.0"
LABEL maintainer="Anouar Zbaida <www.github.com/anoru>"

# Set environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# What you want to in building a Docker image.
# Each library or package is neatly indented 
# and arranged in alphabetical order for readability.
RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    build-essential \
    byobu \
    curl \
    git-core \
    htop \
    pkg-config \
    python3-dev \
    python3-pip \
    python-setuptools \
    python-virtualenv \
    unzip \
    && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-5.0.0.1-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh

ENV PATH /opt/conda/bin:$PATH

RUN pip3 --no-cache-dir install --upgrade \
        altair \
        sklearn-pandas

# Open Ports for Jupyter
# It does not actually publish the port.
# It functions as a type of documentation between the person who builds the image 
# and the person who runs the container, about which ports are intended to be published. 
# To actually publish the port when running the container, use the -p flag on docker run
EXPOSE 7745

# Setup File System
RUN mkdir ds
ENV HOME=/ds
ENV SHELL=/bin/bash

# Allow to share data between your docker container and the host computer.
# When you save a docker image, any data in this VOLUME directory 
# will not be saved as part of the image, however data that exists 
# outside this directory in the container will be saved.
VOLUME /ds

# Sets the working directory in case 
# you want to reference a specific file without absolute paths in another command
WORKDIR /ds

# Copy files from the host computer into the docker container when the docker container is run.
ADD run_jupyter.sh /ds/run_jupyter.sh
RUN chmod +x /ds/run_jupyter.sh

# There can only be one CMD instruction in a Dockerfile. 
# If you list more than one CMD then only the last CMD will take effect.

# Run a shell script that instantiates a Jupyter notebook server.
CMD  ["./run_jupyter.sh"]
