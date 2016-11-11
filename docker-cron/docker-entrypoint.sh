#!/bin/sh

if [ -z "$COMMAND" ] || [ -z "$SCHEDULE" ]; then
  echo "Both COMMAND and SCHEDULE environment variables need to be defined."
  exit 1
fi

if [ ! -S "/var/run/docker.sock" ]; then
  echo "/var/run/docker.sock is not available in the container."
  echo "Did you run with \"-v /var/run/docker.sock:/var/run/docker.sock:ro\"?"
  exit 1
fi

tinycron "$SCHEDULE" "$COMMAND"
