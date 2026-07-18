#!/usr/bin/env bash

set -e

APP="$1"

"/srv/tar-cloud-infra/scripts/build-app.sh" \
"/srv/apps/$APP"
