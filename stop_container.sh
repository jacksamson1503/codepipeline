#!/bin/bash
set -e

if [ "$(docker ps -aq -f name=myapp)" ]; then
    echo "Stopping and removing existing container..."
    docker stop myapp || true
    docker rm myapp || true
else
    echo "No existing container to stop."
fi
