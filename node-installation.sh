#!/bin/sh

# Create games folder
cd ~/projects #
mkdir ~/projects/node-data #
mkdir ~/projects/node-data/MyGames #

# Create volume for node_data folder
balena-engine volume create --name node-data #

# Install node.js as docker container with games folder as volume
balena-engine run -it -p 8000:8000 -v /opt/plcnext/projects/node-data:/data --name node node #
