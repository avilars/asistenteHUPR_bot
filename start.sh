#!/usr/bin/env bash
echo "[start.sh] Iniciando Rasa en PORT=${PORT:-5005} ..."
exec rasa run --enable-api --cors "*" --host 0.0.0.0 --port ${PORT:-5005} --credentials credentials.yml
