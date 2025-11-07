# Imagen base oficial de Rasa
FROM rasa/rasa:3.6.2

# Cambiamos al usuario root para instalar dependencias
USER root

# Copiamos todo el contenido del bot
COPY . /app
WORKDIR /app

# Instalamos dependencias (sin romper las del sistema)
RUN pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt || true

# Damos permisos amplios (necesario en Hugging Face)
RUN chmod -R 777 /app

# Exponemos el puerto estándar de Hugging Face
EXPOSE 7860

# Volvemos al usuario seguro
USER 1001

# Comando de arranque (usa start.sh que gestiona el puerto)
CMD ["bash", "start.sh"]
