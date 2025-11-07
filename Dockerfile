# Imagen base limpia con Python
FROM python:3.10-slim

# Variables de entorno
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Crear directorio de trabajo
WORKDIR /app

# Instalar dependencias del sistema necesarias
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential git curl && \
    rm -rf /var/lib/apt/lists/*

# Copiar el proyecto
COPY . /app

# Instalar versión concreta de Rasa
RUN pip install --no-cache-dir rasa==3.6.2

# Instalar dependencias del proyecto
RUN pip install --no-cache-dir -r requirements.txt

# Corregir compatibilidades
RUN pip install --no-cache-dir "pydantic<1.10.10" "sqlalchemy<2.0"

# Dar permisos de ejecución al script
RUN chmod +x /app/start.sh

# Exponer el puerto
EXPOSE 10000

# Ejecutar directamente tu script
ENTRYPOINT ["/bin/bash", "/app/start.sh"]


