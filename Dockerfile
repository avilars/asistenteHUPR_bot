FROM rasa/rasa:3.6.2
WORKDIR /app
COPY . /app

USER root
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir "pydantic<1.10.10" "sqlalchemy<2.0"
RUN chmod +x /app/start.sh

USER 1001
EXPOSE 10000

CMD ["bash", "/app/start.sh"]

