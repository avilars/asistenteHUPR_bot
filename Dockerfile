FROM rasa/rasa:3.6.2
WORKDIR /app
COPY . /app

# Instalamos dependencias con permisos de usuario
RUN pip install --user --no-cache-dir -r requirements.txt
RUN pip install --user --no-cache-dir "pydantic<1.10.10" "sqlalchemy<2.0"

RUN chmod +x /app/start.sh
EXPOSE 10000
ENTRYPOINT ["bash", "start.sh"]
