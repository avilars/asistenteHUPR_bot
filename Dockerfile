# Imagen base ligera de Python
FROM python:3.10-slim

# Variables de entorno
ENV PYTHONUNBUFFERED=1 \
    PORT=10000

# Crear directorio de trabajo
WORKDIR /app

# Copiar los archivos del proyecto al contenedor
COPY . /app

# Instalar dependencias del sistema necesarias para compilar extensiones Python (como PyYAML)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    python3-dev \
    libffi-dev \
    libssl-dev \
    libyaml-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Actualizar pip e instalar dependencias de Python
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir "pydantic<1.10.10" "sqlalchemy<2.0"

# Dar permisos de ejecución al script
RUN chmod +x /app/start.sh

# Exponer el puerto para Render
EXPOSE 10000

# Establecer el punto de entrada
ENTRYPOINT ["/bin/bash", "/app/start.sh"]



