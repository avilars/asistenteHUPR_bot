#!/usr/bin/env bash
echo "[start.sh] Iniciando Rasa en el puerto ${PORT:-10000} ..."

# Asegura que el modelo existe
if [ ! -d "models" ]; then
  echo "[start.sh] ⚠️ No se encontró la carpeta 'models'. Entrenando modelo base..."
  rasa train
fi

# Ejecuta Rasa con los flags correctos
exec rasa run \
  --enable-api \
  --cors "*" \
  --host 0.0.0.0 \
  --port ${PORT:-10000} \
  --credentials credentials.yml
