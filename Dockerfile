# Imagen oficial de Rasa, ya incluye Tensorflow, PyYAML y Cython compilados
FROM rasa/rasa:3.6.2

WORKDIR /app
COPY . /app

# Instala dependencias adicionales si las hay
RUN pip install --no-cache-dir -r requirements.txt || true

RUN chmod +x start.sh

EXPOSE 10000
CMD ["bash", "start.sh"]
