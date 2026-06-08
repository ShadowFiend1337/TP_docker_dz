FROM python:3.12-alpine

WORKDIR /app

COPY generate.py .

VOLUME ["/data"]

CMD ["python", "generate.py", "/data"]
