FROM python:3.10-slim

# Instala dependencias básicas
RUN apt-get update && apt-get install -y gcc git && rm -rf /var/lib/apt/lists/*

# Copia los archivos al contenedor
WORKDIR /app
COPY . /app

# Instala Rasa y tus dependencias
RUN pip install --no-cache-dir -U pip \
 && pip install --no-cache-dir rasa==3.6.2 rasa-sdk==3.6.2 \
 && pip install --no-cache-dir -r requirements.txt || true

EXPOSE 10000

CMD ["bash", "start.sh"]
