#!/usr/bin/env bash
echo "[start.sh] Iniciando Rasa en el puerto ${PORT:-10000} ..."
rasa run --enable-api --cors "*" --host 0.0.0.0 --port ${PORT:-10000}
