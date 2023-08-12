#!/bin/bash

mkdir -p /goinfre/$USER/docker
rm -rf /Users/$USER/Library/Containers/com.docker.docker
ln -s /goinfre/$USER/docker /Users/$USER/Library/Containers/com.docker.docker
