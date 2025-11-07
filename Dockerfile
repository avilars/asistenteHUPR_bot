# Imagen base de Rasa
FROM rasa/rasa:3.6.2

# Cambiamos a root
USER root

# Copiamos los archivos del bot
COPY . /app
WORKDIR /app

# Instalamos dependencias necesarias
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir "pydantic<1.10.10" "sqlalchemy<2.0"

# Damos permisos al script
RUN chmod +x /app/start.sh

# Exponemos el puerto que usará Render
EXPOSE 10000

# Establecemos el comando de inicio
CMD ["bash", "start.sh"]
