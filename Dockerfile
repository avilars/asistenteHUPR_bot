FROM rasa/rasa:3.6.2

# Cambia temporalmente al usuario root para poder instalar y modificar archivos
USER root

WORKDIR /app
COPY . /app

# Instala dependencias adicionales (opcional)
RUN pip install --no-cache-dir -r requirements.txt || true

# Da permisos de ejecución al script
RUN chmod +x /app/start.sh

# Vuelve al usuario seguro (el que usa Rasa por defecto)
USER 1001

EXPOSE 10000
CMD ["bash", "start.sh"]
