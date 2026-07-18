#!/usr/bin/env bash

set -e

APP="$1"

echo "================================="
echo "Building $(basename "$APP")"
echo "================================="

git -C "$APP" pull

docker compose \
    -f "$APP/compose.yml" \
    pull || true

docker compose \
    -f "$APP/compose.yml" \
    up -d --build
