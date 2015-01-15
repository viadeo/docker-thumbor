#!/bin/bash

THUMBOR_IMAGE=thumbor
THUMBOR_NAME=thumbor

# Build images
echo "Building $THUMBOR_IMAGE"
docker build -t $THUMBOR_IMAGE .

# Run main container
docker kill $THUMBOR_NAME
docker run --rm -p 8888:8888 --name=$THUMBOR_NAME $THUMBOR_IMAGE &
sleep 1

# Check if Thumbor is running
curl -s "http://localhost:8888/healthcheck" | grep "WORKING"

# Stop main container
docker stop $THUMBOR_NAME
