#!/usr/bin/env bash
echo "[start.sh] Iniciando Rasa en el puerto 10000 ..."

# Ejecuta Rasa con API activa, CORS abierto y puerto 10000 (Render usa variable PORT)
rasa run --enable-api --cors "*" --host 0.0.0.0 --port ${PORT:-10000}
