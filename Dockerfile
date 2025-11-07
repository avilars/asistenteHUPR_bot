# Imagen base de Python ligera
FROM python:3.10-slim

# Variables de entorno
ENV PYTHONUNBUFFERED=1 \
    PORT=10000

# Carpeta de trabajo
WORKDIR /app

# Copiar archivos del proyecto
COPY . /app

# Instalar dependencias del sistema necesarias para compilar PyYAML y otras
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    python3-dev \
    libffi-dev \
    libssl-dev \
    libyaml-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# 🔧 Instalar herramientas de compilación antes de las dependencias
RUN pip install --upgrade pip setuptools wheel cython

# Instalar dependencias del proyecto
RUN pip install --no-cache-dir -r requirements.txt

# Asegurar compatibilidad de librerías requeridas por Rasa
RUN pip install --no-cache-dir "pydantic<1.10.10" "sqlalchemy<2.0"

# Dar permisos de ejecución al script
RUN chmod +x /app/start.sh

# Exponer el puerto
EXPOSE 10000

# Punto de entrada del contenedor
ENTRYPOINT ["/bin/bash", "/app/start.sh"]

