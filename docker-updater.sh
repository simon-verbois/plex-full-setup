#!/bin/bash

apps=("plex" "filebot" "kometa")

# Update usual docker-compose
for i in "${apps[@]}"; do
  cd "/volume1/docker/$i" || exit
  docker-compose down
  docker-compose pull
  docker-compose up -d
done
