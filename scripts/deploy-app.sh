#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(dirname "$0")"

"$SCRIPT_DIR/discover-apps.sh" |
while read -r APP
do
    "$SCRIPT_DIR/build-app.sh" "$APP"
done
