#!/usr/bin/env bash
echo "[start.sh] Iniciando Rasa en PORT=${PORT} ..."
exec rasa run \
  --enable-api \
  --cors "*" \
  --port ${PORT} \
  --host 0.0.0.0 \
  --credentials credentials.yml


