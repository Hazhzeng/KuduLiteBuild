#!/usr/bin/env bash
set -x -e

organization="rogerxman"
buildnumber=${4-$(date -u +"%y%m%d%H%M")}
imagename="$organization/kudulite:$buildnumber"

docker build --no-cache -t "$imagename" kudu
docker tag "$imagename" "$imagename"

# Build and Run
docker container rm -f kudulite
