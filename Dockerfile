# Imagen base oficial de Rasa
FROM rasa/rasa:3.6.2

# Directorio de trabajo
WORKDIR /app

# Copiamos los archivos del bot
COPY . /app

# --- Instalamos dependencias como root temporalmente ---
USER root
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir "pydantic<1.10.10" "sqlalchemy<2.0"
# --------------------------------------------------------

# Volvemos al usuario estándar de Rasa
USER 1001

# Damos permisos al script
RUN chmod +x /app/start.sh

# Exponemos el puerto
EXPOSE 10000

# Ejecutamos el script
ENTRYPOINT ["bash", "start.sh"]
