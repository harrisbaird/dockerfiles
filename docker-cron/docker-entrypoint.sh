#!/bin/sh

if [ -z "$COMMAND" ] || [ -z "$SCHEDULE" ]; then
  echo "Both COMMAND and SCHEDULE environment variables need to be defined."
  exit 1
fi

if [ ! -S "/var/run/docker.sock" ]; then
  echo "/var/run/docker.sock is not available in the container."
  echo "Did you run with \"-v /var/run/docker.sock:/var/run/docker.sock:ro\"?"
  echo "docker-cloud will still work but anything requiring the docker socket will not."
fi

tinycron "$SCHEDULE" "$COMMAND"
