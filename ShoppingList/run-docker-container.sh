#!/bin/bash

# runs a container with bind-mounted current project dir so testing and builng under linux can be exercised.
# there is no mongo db setup so functionalities are limited for just testing and building the swift app.
docker container run -it --rm -v $(pwd):/opt/shopping-list boyankov/swift:swift-4.2-ubuntu-16.04 

# remember to add all dependencies for Perfect from the .Dockerfile!
# when ssh-ed to container's shell
