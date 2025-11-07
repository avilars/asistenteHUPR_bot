FROM rasa/rasa:3.6.2
WORKDIR /app
COPY . /app

# Instalamos dependencias como root temporalmente
USER root
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir "pydantic<1.10.10" "sqlalchemy<2.0"

# Damos permisos al script ANTES de volver al usuario normal
RUN chmod +x /app/start.sh

# Volvemos al usuario estándar
USER 1001

EXPOSE 10000
ENTRYPOINT ["bash", "start.sh"]
