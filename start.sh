#!/usr/bin/env bash
echo "[start.sh] Iniciando Rasa en PORT=${PORT:-5005} ..."
exec rasa run \
  --enable-api \
  --cors "*" \
  --port ${PORT:-5005} \
  --host 0.0.0.0 \
  --credentials credentials.yml

