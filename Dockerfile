FROM python:3.10-slim

# Instala dependencias del sistema necesarias para compilar librerías de Rasa
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    libssl-dev \
    libffi-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Crea carpeta de trabajo
WORKDIR /app
COPY . /app

# Instala pip y Rasa + SDK
RUN pip install --no-cache-dir -U pip
RUN pip install --no-cache-dir rasa==3.6.2 rasa-sdk==3.6.2

# Instala tus dependencias adicionales (opcional)
RUN pip install --no-cache-dir -r requirements.txt || true

# Asegura permisos al script
RUN chmod +x start.sh

EXPOSE 10000

CMD ["bash", "start.sh"]
