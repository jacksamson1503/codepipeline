#!/bin/bash
set -e

if [ "$(docker ps -aq -f name=^myapp$)" ]; then
    echo "Stopping existing container..."
    docker stop myapp || true
    docker rm myapp || true
else
    echo "No existing container found."
fi