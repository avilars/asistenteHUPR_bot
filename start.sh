#!/usr/bin/env bash
PORT=${PORT:-7860}

echo "[start.sh] Iniciando Rasa en PORT=${PORT} ..."
exec rasa run \
  --enable-api \
  --cors "*" \
  --port ${PORT} \
  --host 0.0.0.0 \
  --endpoints endpoints.yml \
  --credentials credentials.yml
