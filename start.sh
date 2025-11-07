#!/usr/bin/env bash
set -e

PORT=${PORT:-10000}
echo "[start.sh] Iniciando Rasa en el puerto ${PORT} ..."

rasa run --enable-api \
  --cors "*" \
  --host "0.0.0.0" \
  --port "${PORT}" \
  --endpoints endpoints.yml \
  --credentials credentials.yml
