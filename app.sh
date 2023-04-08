#!/usr/bin/env bash

function up() {
  docker compose \
    -f docker-compose.yml \
    --project-name app \
    up \
    -d
}

function down() {
  docker compose \
    -f docker-compose.yml \
    -v \
    --project-name app \
    down
}

if [ "$1" == "stop" ]; then
  down
else
  up
fi
