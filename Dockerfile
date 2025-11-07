# Imagen base ligera de Python
FROM python:3.10-slim

# Variables de entorno
ENV PYTHONUNBUFFERED=1 \
    PORT=10000

# Carpeta de trabajo
WORKDIR /app

# Copiar todo el proyecto
COPY . /app

# Instalar dependencias del sistema necesarias para compilar algunas librerías
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    python3-dev \
    libffi-dev \
    libssl-dev \
    libyaml-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Actualizar pip y preparar entorno de compilación
RUN pip install --upgrade pip setuptools wheel cython

# 🔧 Instalar versión binaria estable de PyYAML antes que Rasa
RUN pip install --no-cache-dir "PyYAML==6.0.1"

# Instalar dependencias del proyecto
RUN pip install --no-cache-dir -r requirements.txt

# Asegurar compatibilidad con Rasa
RUN pip install --no-cache-dir "pydantic<1.10.10" "sqlalchemy<2.0"

# Permisos de ejecución
RUN chmod +x /app/start.sh

# Exponer puerto
EXPOSE 10000

# Entrypoint
ENTRYPOINT ["/bin/bash", "/app/start.sh"]

