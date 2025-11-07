FROM rasa/rasa:3.6.2

USER root

WORKDIR /app
COPY . /app

# Instala dependencias adicionales
RUN pip install --no-cache-dir -r requirements.txt || true
RUN chmod +x /app/start.sh

USER 1001

EXPOSE 10000
ENTRYPOINT ["bash", "start.sh"]
