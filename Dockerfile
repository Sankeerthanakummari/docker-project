FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

WORKDIR /app

COPY requirements.txt /app/
COPY . /app/

RUN apt-get update && \
    apt-get install -y python3 python3-pip tzdata && \
    pip install -r requirements.txt

EXPOSE 8000

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

