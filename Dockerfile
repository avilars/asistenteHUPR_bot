# Imagen base de Rasa
FROM rasa/rasa:3.6.2

# Directorio de trabajo
WORKDIR /app

# Copiar todo el contenido del proyecto al contenedor
COPY . /app

# Cambiar a usuario root para poder instalar paquetes
USER root

# Instalar dependencias del proyecto
RUN pip install --no-cache-dir -r requirements.txt

# Corregir incompatibilidades de versiones (SQLAlchemy y Pydantic)
RUN pip install --no-cache-dir "pydantic<1.10.10" "sqlalchemy<2.0"

# Dar permisos de ejecución al script de arranque
RUN chmod +x /app/start.sh

# Cambiar a usuario no root (requerido por Render)
USER 1001

# Exponer el puerto del servidor Rasa
EXPOSE 10000

# 🔥 Sobrescribir el ENTRYPOINT del contenedor base (Rasa define "rasa" por defecto)
ENTRYPOINT ["/bin/bash", "/app/start.sh"]
