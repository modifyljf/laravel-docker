#!/usr/bin/env bash

if [ "$1" == "stop" ]; then
  docker compose \
    -f ./app/docker-compose.yml \
    -v \
    --env-file .env \
    --project-name app \
    down
else
  docker compose \
    -f ./app/docker-compose.yml \
    --env-file .env \
    --project-name app \
    up
fi
