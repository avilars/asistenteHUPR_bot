# Imagen base ligera con Python
FROM python:3.10-slim

# Variables de entorno
ENV PYTHONUNBUFFERED=1 \
    PORT=10000

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential git && \
    rm -rf /var/lib/apt/lists/*

# Copiar archivos
WORKDIR /app
COPY . /app

# Instalar dependencias de Python
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir "pydantic<1.10.10" "sqlalchemy<2.0"

# Dar permisos al script
RUN chmod +x /app/start.sh

# Exponer el puerto
EXPOSE 10000

# Entrypoint limpio
ENTRYPOINT ["/bin/bash", "/app/start.sh"]


