FROM python:3.5-alpine

WORKDIR /app
COPY src/ /app

RUN pip install -r requirements.txt

EXPOSE 8181

ENTRYPOINT ["python", "main.py"]