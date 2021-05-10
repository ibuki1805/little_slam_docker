#!/bin/bash

echo "=== run_docker ==="

IMAGE_NAME=little_slam_docker:latest
# SCRIPT_DIR=$(cd $(dirname $0); pwd)

# ./update_repositories.py

docker run -it --rm \
  --net='host' \
  --name="little_slam_docker" \
  $IMAGE_NAME
