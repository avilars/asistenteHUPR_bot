FROM rasa/rasa:3.6.2

WORKDIR /app
COPY . /app

# Instala dependencias adicionales si las hay
RUN pip install --no-cache-dir -r requirements.txt || true

# Da permisos de ejecución al start.sh
RUN chmod +x start.sh

EXPOSE 10000

CMD ["bash", "start.sh"]
