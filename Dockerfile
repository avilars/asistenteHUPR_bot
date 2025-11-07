# Imagen base oficial de Rasa
FROM rasa/rasa:3.6.2

# Eliminar el ENTRYPOINT original ("rasa")
ENTRYPOINT []

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar los archivos del proyecto
COPY . /app

# Cambiar a usuario root para instalar dependencias
USER root

# Instalar dependencias del proyecto
RUN pip install --no-cache-dir -r requirements.txt

# Asegurar compatibilidad de dependencias
RUN pip install --no-cache-dir "pydantic<1.10.10" "sqlalchemy<2.0"

# Dar permisos al script de inicio
RUN chmod +x /app/start.sh

# Cambiar a usuario no root (Render lo requiere)
USER 1001

# Exponer el puerto donde correrá Rasa
EXPOSE 10000

# Definir el comando que ejecuta tu bot
ENTRYPOINT ["/bin/bash", "/app/start.sh"]

