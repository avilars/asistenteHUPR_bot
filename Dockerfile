# Imagen base oficial de Rasa
FROM rasa/rasa:3.6.2

# Cambiamos al usuario root para instalar dependencias con permisos
USER root

# Copiamos el contenido del bot
COPY . /app
WORKDIR /app

# Instalamos dependencias sin tocar las del sistema
RUN pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt --user || true

# Ajustamos permisos
RUN chmod -R 777 /app

# Exponemos el puerto que usa Hugging Face
EXPOSE 7860

# Volvemos al usuario seguro
USER 1001

# 🟢 ENTRYPOINT fijo para evitar que Hugging Face inserte /bin/bash
ENTRYPOINT ["rasa"]

# 🟢 CMD limpio con todos los argumentos correctos
CMD ["run", "--enable-api", "--cors", "*", "--host", "0.0.0.0", "--port", "7860", "-m", "models", "--endpoints", "endpoints.yml", "--credentials", "credentials.yml"]

