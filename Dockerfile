FROM python:3.10-slim

# Instala dependencias básicas del sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    libssl-dev \
    libffi-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

# Asegura versión moderna de pip
RUN pip install --no-cache-dir -U pip

# Instala Rasa y SDK globalmente (saltando restricciones del venv de Render)
RUN pip install --no-cache-dir rasa==3.6.2 rasa-sdk==3.6.2 --break-system-packages || \
    pip install --no-cache-dir rasa==3.6.2 rasa-sdk==3.6.2 --prefix /usr/local

# Instala dependencias adicionales (sin romper si falla alguna)
RUN pip install --no-cache-dir -r requirements.txt --break-system-packages || true

RUN chmod +x start.sh

EXPOSE 10000
CMD ["bash", "start.sh"]
