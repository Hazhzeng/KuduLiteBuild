#!/usr/bin/env bash
set -x -e

organization="rogerxman"
buildnumber=${4-$(date -u +"%y%m%d%H%M")}

docker build --no-cache -t "$organization"/kudulite:"$buildnumber" kudu
docker tag "$organization"/kudulite:"$buildnumber" "$organization"/kudulite:"$buildnumber"

#docker login -u "$2" -p "$3"

#docker push "$1"/kudulite:"$buildnumber"
#docker push "$1"/kudulite:latest

#docker logout
