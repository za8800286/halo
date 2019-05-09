#!/bin/bash

VERSION=$(ls build/libs | sed 's/.*halo-//' | sed 's/.jar$//')

echo "Halo version: $VERSION"

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker build -t $DOCKER_USERNAME/halo -t $DOCKER_USERNAME/$VERSION .
docker images
docker push $DOCKER_USERNAME/halo
