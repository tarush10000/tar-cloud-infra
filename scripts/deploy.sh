#!/usr/bin/env bash

set -e

echo "=================================="
echo "Deploying Tar Cloud Infrastructure"
echo "=================================="

set -a
# shellcheck disable=SC1091
source /srv/docker/env/tar-cloud.env
set +a

find compose -name "compose.yml" | sort | while read -r file
do
    echo ""
    echo "Deploying: $file"

    docker compose -f "$file" pull
    docker compose -f "$file" up -d
done

echo ""
echo "Deployment complete."

echo ""
echo "Deploying applications..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/deploy-apps.sh"
