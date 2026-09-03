#!/bin/bash
set -e

IMAGE_NAME="jack1503/simple-python-flask-app:latest"

docker pull "$IMAGE_NAME"
docker run -d --name myapp -p 5000:5000 "$IMAGE_NAME"

echo "Container started successfully."