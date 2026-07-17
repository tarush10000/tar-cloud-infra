#!/usr/bin/env bash

set -e

echo "Cleaning Docker..."

docker container prune -f
docker image prune -af
docker network prune -f
docker builder prune -af

echo "Done."
