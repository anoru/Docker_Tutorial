#! /bin/bash

# Build the docker image
sudo docker build -t tutorial -f ./Dockerfile ./

# tutorial : the name or tag of image

# ./Dockerfile : the location of the DokerFile

# ./ : the host directory that is the context of the build.
# The ADD statement in the DokerFile will reference this directory on the host for copying files.
# In the DokerFile we must reference files relative to this path.
