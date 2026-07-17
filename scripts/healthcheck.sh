#!/usr/bin/env bash

set -e

echo "Checking Docker containers..."

docker ps

echo ""
echo "Checking compose files..."

find compose -name "compose.yml" | sort | while read -r file
do
    docker compose -f "$file" ps
done

echo ""
echo "Health check completed."