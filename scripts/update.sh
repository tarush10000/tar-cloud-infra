#!/usr/bin/env bash

set -e

echo "Updating all containers..."

find compose -name "compose.yml" | sort | while read -r file
do
    docker compose -f "$file" pull
    docker compose -f "$file" up -d
done

docker image prune -f

echo "Finished."