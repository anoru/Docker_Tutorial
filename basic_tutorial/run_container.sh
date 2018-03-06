#! /bin/bash

# Run the container
docker run -it --name container1 --net=host -v ~/docker_files/:/ds tutorial

# -it : Run interactively

# container1 : Container name

# --net=host : Bind all ports to host Ex: fpr Jupyter

# ~/docker_files/ : Host directory to you will mount as a volume inside container

# /ds : Destination of (directory inside container) for host directory you wish to mount.

# tutorial : Image Name
