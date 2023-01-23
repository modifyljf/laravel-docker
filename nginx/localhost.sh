#!/bin/sh

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -subj "/C=US/ST=NY/O=Company, Inc./CN=127.0.0.1" \
  -keyout ssl/private/nginx-selfsigned.key \
  -out ssl/certs/nginx-selfsigned.crt
