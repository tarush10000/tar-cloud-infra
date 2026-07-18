#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/discover-app.sh" |
while read -r APP
do
    "$SCRIPT_DIR/build-app.sh" "$APP"
done
