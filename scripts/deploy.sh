#!/usr/bin/env bash

set -e

echo "=================================="
echo "Deploying Tar Cloud Infrastructure"
echo "=================================="

find compose -name "compose.yml" | sort | while read -r file
do
    echo ""
    echo "Deploying: $file"

    docker compose -f "$file" pull
    docker compose -f "$file" up -d
done

echo ""
echo "Deployment complete."