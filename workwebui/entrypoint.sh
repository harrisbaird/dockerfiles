#!/bin/sh

if [ -z "$REDIS_NAMESPACE" ]; then
    echo "REDIS_NAMESPACE environment variable not set"
    exit 1
fi

REDIS_HOST=${VARIABLE:-redis:6379}

workwebui -redis="$REDIS_HOST" \
          -ns="$REDIS_NAMESPACE" \
          -listen="0.0.0.0:8080"
