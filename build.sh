#!/bin/bash
docker buildx build --platform linux/arm/v7 -t alexlndn/raspi-temp:armv7 .
docker buildx build --platform linux/arm64 -t alexlndn/raspi-temp:arm64 .
docker buildx build --platform linux/amd64 -t alexlndn/raspi-temp:amd64 .

docker push alexlndn/raspi-temp:armv7
docker push alexlndn/raspi-temp:arm64
docker push alexlndn/raspi-temp:amd64

docker manifest create alexlndn/raspi-temp:latest alexlndn/raspi-temp:arm64 alexlndn/raspi-temp:armv7 alexlndn/raspi-temp:amd64 --amend
docker manifest push alexlndn/raspi-temp:latest
