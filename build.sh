#!/usr/bin/env bash
set -x -e

organization="rogerxman"
buildnumber=${4-$(date -u +"%y%m%d%H%M")}
imagename="$organization/kudulite:$buildnumber"

docker build --no-cache -t "$imagename" kudu
docker tag "$imagename" "$imagename"

# Build and Run
docker container rm -f kudulite

echo "Running $imagename"
docker run --name kudulite --publish 8080:80 -e "CONTAINER_ENCRYPTION_KEY=MDEyMzQ1Njc4OUFCQ0RFRjAxMjM0NTY3ODlBQkNERUY=" -e "WEBSITE_AUTH_ENCRYPTION_KEY=C96FDBE3D890CDE64725942B8D797EB20E61322F14263804C5EA77396E8B6722" -e "WEBSITE_SITE_NAME=linuxfunctiondev-hazengprivate5-func" -e "WEBSITE_HOSTNAME=linuxfunctiondev-hazengprivate5-func.hazengprivate5.antares-test.windows-int.net" --rm "$imagename"
