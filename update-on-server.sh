#!/bin/bash
$SERVER_NAME="$1"
$COMPOSE_DIR="$2"
rsync -av --delete --exclude=.git ./ $SERVER_NAME:/tmp/ocr-meter/
ssh $SERVER_NAME "/tmp/ocr-meter/update-docker-image.sh;
cd $COMPOSE_DIR;
docker compose up -d"
