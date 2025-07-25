FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y libpq-dev gcc

RUN apt-get install -y curl

COPY ./server/requirements.txt .

RUN pip install -r requirements.txt

COPY ./server/ .

EXPOSE 8000

CMD ["gunicorn", "--workers", "4", "--bind", "0.0.0.0:8000", "backend.wsgi:application"]